class Todo {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  Todo({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        userId: json['userId'] ?? 0,
        title: json['title'],
        completed: json['completed'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'completed': completed,
      };

  Todo copyWith({
    int? id,
    int? userId,
    String? title,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
