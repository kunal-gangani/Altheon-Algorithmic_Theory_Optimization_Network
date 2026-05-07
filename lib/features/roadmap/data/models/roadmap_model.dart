class RoadmapModel {
  final int day;
  final String title;
  final List<String> tasks;

  const RoadmapModel({
    required this.day,
    required this.title,
    required this.tasks,
  });

  factory RoadmapModel.fromJson(Map<String, dynamic> json) {
    return RoadmapModel(
      day: json['day'],
      title: json['title'],
      tasks: List<String>.from(json['tasks']),
    );
  }
}
