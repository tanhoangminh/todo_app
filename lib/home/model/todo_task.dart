class TodoTask {
  final String title;
  final String des;

  TodoTask({required this.title, required this.des});

  factory TodoTask.fromJson(Map<String, dynamic> json) {
    return TodoTask(
      title: json['title'],
      des: json['des'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'des': des};
  }
}
