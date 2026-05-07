import 'package:hive_flutter/hive_flutter.dart';

class ProgressService {
  static const String boxName = 'progressBox';

  static Future<void> init() async {
    await Hive.openBox(boxName);
  }

  static int getCurrentDay() {
    final box = Hive.box(boxName);
    return box.get('currentDay', defaultValue: 1);
  }

  static Future<void> completeDay(int currentDay) async {
    final box = Hive.box(boxName);
    await box.put('currentDay', currentDay + 1);
  }
}
