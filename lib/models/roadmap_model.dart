class RoadmapDay {
  final int day;
  final String title;
  final List<String> topics;
  final String difficulty;
  final int estimatedHours;

  RoadmapDay({
    required this.day,
    required this.title,
    required this.topics,
    required this.difficulty,
    required this.estimatedHours,
  });

  factory RoadmapDay.fromJson(Map<String, dynamic> json) {
    return RoadmapDay(
      day: json['day'],
      title: json['title'],
      topics: List<String>.from(json['topics']),
      difficulty: json['difficulty'],
      estimatedHours: json['estimatedHours'],
    );
  }
}
