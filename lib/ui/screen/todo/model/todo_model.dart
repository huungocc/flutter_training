class TodoModel {
  String? taskTitle;
  String? category;
  String? date;
  String? time;
  String? notes;

  TodoModel({
    this.taskTitle,
    this.category,
    this.date,
    this.time,
    this.notes
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    taskTitle = json['task_title'];
    category = json['category'];
    date = json['date'];
    time = json['time'];
    notes = json['notes'];
  }
}