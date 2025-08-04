import 'package:crud_app/todo_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Controller extends GetxController {
  final GetConnect connect = GetConnect();
  final TextEditingController titleController = TextEditingController();
  final RxMap<int, Todo> todos = <int, Todo>{}.obs;
  final RxBool saving = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  @override
  void onClose() {
    titleController.dispose();
    super.onClose();
  }

  Future<void> fetchTodos() async {
    final response = await connect.get('https://jsonplaceholder.typicode.com/todos');
    if (response.statusCode == 200) {
      List data = response.body;
      final result = {
        for (var todo in data.take(20)) Todo.fromJson(todo).id: Todo.fromJson(todo)
      };
      todos.assignAll(result);
    }
  }

  Future<void> createTodo() async {
    if (titleController.text.trim().isEmpty) return;
    saving.value = true;

    final response = await connect.post('https://jsonplaceholder.typicode.com/todos', {
      'userId': 1,
      'title': titleController.text,
      'completed': false,
    });

    if (response.statusCode == 201) {
      Todo newTodo = Todo.fromJson(response.body);
      
      int newId = todos.isEmpty ? 1 : (todos.keys.reduce((a, b) => a > b ? a : b) + 1);
      
      Todo uniqueTodo = newTodo.copyWith(id: newId);
      todos[uniqueTodo.id] = uniqueTodo;
    }

    titleController.clear();
    saving.value = false;
  }

  Future<void> updateTodoStatus(int id, bool completed) async {
    saving.value = true;
    final response = await connect.put('https://jsonplaceholder.typicode.com/todos/$id', {
      'completed': completed,
    });

    if (response.statusCode == 200 && todos.containsKey(id)) {
      todos[id] = todos[id]!.copyWith(completed: completed);
    }
    saving.value = false;
  }

  Future<void> deleteTodo(int id) async {
    saving.value = true;
    final response = await connect.delete('https://jsonplaceholder.typicode.com/todos/$id');
    if (response.statusCode == 200) {
      todos.remove(id);
    }
    saving.value = false;
  }
}
