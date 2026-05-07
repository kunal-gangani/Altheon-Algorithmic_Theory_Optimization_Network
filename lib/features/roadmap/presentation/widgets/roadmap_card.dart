import 'package:flutter/material.dart';

class RoadmapCard extends StatelessWidget {
  final String day;
  final String title;
  final List<String> tasks;
  final bool active;
  final bool completed;
  final VoidCallback? onComplete;

  const RoadmapCard({
    super.key,
    required this.day,
    required this.title,
    required this.tasks,
    required this.active,
    required this.completed,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(day, style: const TextStyle(color: Colors.white70)),

            const SizedBox(height: 8),

            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ...tasks.map(
              (task) => Padding(
                padding: const EdgeInsets.only(bottom: 8),

                child: Row(
                  children: [
                    Icon(
                      active ? Icons.check_circle : Icons.lock,

                      color: active ? Colors.greenAccent : Colors.grey,
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        task,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            if (active)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onComplete,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00FFFF),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'MARK AS COMPLETE',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
