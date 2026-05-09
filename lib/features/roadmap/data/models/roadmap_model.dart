class RoadmapModel {
  final int day;
  final String title;
  final List<String> tasks;

  final List<TheoryModel> theory;
  final List<ExampleModel> examples;
  final List<QuizModel> quiz;

  RoadmapModel({
    required this.day,
    required this.title,
    required this.tasks,
    required this.theory,
    required this.examples,
    required this.quiz,
  });

  factory RoadmapModel.fromJson(Map<String, dynamic> json) {
    return RoadmapModel(
      day: json['day'],

      title: json['title'],

      tasks: List<String>.from(json['tasks']),

      theory: (json['theory'] as List)
          .map((e) => TheoryModel.fromJson(e))
          .toList(),

      examples: (json['examples'] as List)
          .map((e) => ExampleModel.fromJson(e))
          .toList(),

      quiz: (json['quiz'] as List).map((e) => QuizModel.fromJson(e)).toList(),
    );
  }
}

class TheoryModel {
  final String heading;
  final String content;

  TheoryModel({required this.heading, required this.content});

  factory TheoryModel.fromJson(Map<String, dynamic> json) {
    return TheoryModel(heading: json['heading'], content: json['content']);
  }
}

class ExampleModel {
  final String title;
  final String code;
  final String explanation;

  ExampleModel({
    required this.title,
    required this.code,
    required this.explanation,
  });

  factory ExampleModel.fromJson(Map<String, dynamic> json) {
    return ExampleModel(
      title: json['title'],
      code: json['code'],
      explanation: json['explanation'],
    );
  }
}

class QuizModel {
  final String question;
  final List<String> options;
  final int answer;

  QuizModel({
    required this.question,
    required this.options,
    required this.answer,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      question: json['question'],

      options: List<String>.from(json['options']),

      answer: json['answer'],
    );
  }
}
