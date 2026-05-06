import 'dart:convert';
import 'package:algorithmic_thory_optimization_network/models/roadmap_model.dart';
import 'package:flutter/services.dart';

class RoadmapService {
  static Future<List<RoadmapDay>> loadRoadmap() async {
    final String response = await rootBundle.loadString(
      'assets/data/roadmap.json',
    );

    final List<dynamic> data = json.decode(response);

    return data.map((e) => RoadmapDay.fromJson(e)).toList();
  }
}
