import 'package:crud_app/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;
  final Controller controller;

  const TodosList({
    super.key,
    required this.todos,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 100),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return _buildTodoCard(todo, index);
      },
    );
  }

  Widget _buildTodoCard(Todo todo, int index) {
    final isCompleted = todo.completed;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Card(
        color: const Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        shadowColor: Colors.black26,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            controller.updateTodoStatus(todo.id, !todo.completed);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.updateTodoStatus(todo.id, !todo.completed);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isCompleted ? const Color(0xFF6A4C93) : Colors.transparent,
                      border: Border.all(
                        color: isCompleted 
                            ? const Color(0xFF6A4C93) 
                            : const Color(0xFF9A7FB8),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: isCompleted
                        ? const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: TextStyle(
                          color: isCompleted ? Colors.white54 : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: isCompleted
                                  ? Colors.green.withOpacity(0.2)
                                  : Colors.orange.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              isCompleted ? " Completed" : " Pending",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isCompleted
                                    ? Colors.greenAccent.shade200
                                    : Colors.orangeAccent.shade200,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    onPressed: () => _showDeleteConfirmation(todo),
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(Todo todo) {
  Get.dialog(
    AlertDialog(
      backgroundColor: const Color(0xFF1A1A2E),
      title: Text("Delete Todo", style: TextStyle(color: Colors.white)),
      content: Text("Are you sure you want to delete this?", style: TextStyle(color: Colors.white70)),
      actions: [
        TextButton(
          child: Text("Cancel"),
          onPressed: () => Get.back(),
        ),
        ElevatedButton(
          onPressed: () {
            Get.find<Controller>().deleteTodo(todo.id);
            Get.back(); // Close dialog
          },
          child: Text("Delete"),
        ),
      ],
    ),
  );
// }


  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.task_alt_outlined,
              size: 50,
              color: Color(0xFF6A4C93),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'No tasks yet!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add your first task to get started',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}