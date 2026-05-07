import 'package:hive_flutter/hive_flutter.dart';

class ProgressService {
  static const String boxName = 'roadmap_progress';

  static Future<void> init() async {
    await Hive.openBox(boxName);
  }

  static int getCurrentDay() {
    final box = Hive.box(boxName);
    return box.get('current_day', defaultValue: 1);
  }

  static Future<void> completeDay(int day) async {
    final box = Hive.box(boxName);

    await box.put('current_day', day + 1);
  }
}