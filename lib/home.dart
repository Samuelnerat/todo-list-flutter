import 'package:crud_app/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF6A4C93),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Text(
                                'F',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search, color: Colors.white70),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.notifications_outlined, color: Colors.white70),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Hello Favour 👋',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Let's get started keeping your tasks organized",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white60,
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (controller.saving.value)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1A2E),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white70,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Saving...',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: controller.todos.isEmpty
                        ? _buildEmptyState()
                        : TodosList(
                            todos: controller.todos.values.toList(),
                            controller: controller,
                          ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Container(
            margin: const EdgeInsets.only(bottom: 80, right: 16),
            child: FloatingActionButton(
              onPressed: () => _showAddTodoDialog(),
              elevation: 8,
              child: const Icon(Icons.add, size: 28),
            ),
          ),
        ));
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(60),
            ),
            child: const Icon(
              Icons.task_alt_outlined,
              size: 60,
              color: Color(0xFF6A4C93),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'No tasks yet!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add a task to get started with your productivity journey',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }

  void _showAddTodoDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: const Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.titleController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Task title',
                  hintText: 'eg. Buy a bike',
                  prefixIcon: Icon(Icons.edit_outlined, color: Color(0xFF6A4C93)),
                ),
                autofocus: true,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      controller.createTodo();
                      Get.back();
                    },
                    child: const Text('Add Task'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}