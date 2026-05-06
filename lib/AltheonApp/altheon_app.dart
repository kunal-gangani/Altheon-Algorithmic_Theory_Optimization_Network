import 'package:algorithmic_thory_optimization_network/core/theme/app_theme.dart';
import 'package:algorithmic_thory_optimization_network/features/roadmap/presentation/page/roadmap_page.dart';
import 'package:flutter/material.dart';

class AltheonApp extends StatelessWidget {
  const AltheonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ALTHEON',
      theme: AppTheme.darkTheme,
      home: const RoadmapPage(),
    );
  }
}
