class Task {
  static const String collectionName = "Tasks";
  String? id;
  String? title;
  String? description;
  bool? isDone;
  DateTime? date;

  Task({this.id, this.title, this.description, this.isDone, this.date});

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "isDone": isDone,
      "date": date,
    };
  }

  Task.fromFireStore(Map<String, dynamic>? data) {
    id = data?["id"];
    title = data?["title"];
    description = data?["description"];
    isDone = data?["isDone"];
    date = data?["date"];
  }
}
