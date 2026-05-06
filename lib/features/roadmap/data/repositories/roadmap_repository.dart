import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/roadmap_model.dart';

class RoadmapRepository {
  Future<List<RoadmapModel>> fetchRoadmap() async {
    final jsonString = await rootBundle.loadString('assets/data/roadmap.json');

    final List decoded = json.decode(jsonString);

    return decoded.map((e) => RoadmapModel.fromJson(e)).toList();
  }
}
