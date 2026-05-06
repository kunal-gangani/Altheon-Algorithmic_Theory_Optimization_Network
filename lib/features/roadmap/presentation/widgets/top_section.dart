import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  final int completedDays;
  final int totalDays;
  final double progress;

  const TopSection({
    super.key,
    required this.completedDays,
    required this.totalDays,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white10,
            color: const Color(0xFF00FFFF),
          ),

          const SizedBox(height: 12),

          Text(
            'Day $completedDays / $totalDays Completed',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
