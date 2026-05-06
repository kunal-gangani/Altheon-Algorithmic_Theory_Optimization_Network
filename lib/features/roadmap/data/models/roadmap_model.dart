class RoadmapModel {
  final int day;
  final String title;
  final String status;
  final List<String> tasks;

  const RoadmapModel({
    required this.day,
    required this.title,
    required this.status,
    required this.tasks,
  });

  bool get isActive => status == "ACTIVE";

  bool get isCompleted => status == "COMPLETED";

  factory RoadmapModel.fromJson(Map<String, dynamic> json) {
    return RoadmapModel(
      day: json['day'],
      title: json['title'],
      status: json['status'],
      tasks: List<String>.from(json['tasks']),
    );
  }
}
