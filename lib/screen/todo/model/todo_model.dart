class TodoModel {
  String? id;
  String? taskTitle;
  String? category;
  DateTime? date;
  String? time;
  String? notes;
  bool? completed;

  TodoModel({
    this.id,
    this.taskTitle,
    this.category,
    this.date,
    this.time,
    this.notes,
    this.completed = false
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id']?.toString(),
      taskTitle: json['task_title'],
      category: json['category'],
      date: json['date'] != null ? DateTime.tryParse(json['date']) : null,
      time: json['time'],
      notes: json['notes'],
      completed: json['completed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'task_title': taskTitle,
      'category': category,
      'date': date?.toIso8601String().split('T').first,
      'time': time,
      'notes': notes,
      'completed': completed,
    };
  }

  TodoModel copyWith({
    String? id,
    String? taskTitle,
    DateTime? date,
    String? time,
    String? notes,
    String? category,
    bool? completed,
  }) {
    return TodoModel(
      id: id ?? this.id,
      taskTitle: taskTitle ?? this.taskTitle,
      date: date ?? this.date,
      time: time ?? this.time,
      notes: notes ?? this.notes,
      category: category ?? this.category,
      completed: completed ?? this.completed,
    );
  }
}
