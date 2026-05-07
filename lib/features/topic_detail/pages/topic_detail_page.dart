import 'package:flutter/material.dart';

import '../../roadmap/data/models/roadmap_model.dart';

class TopicDetailPage extends StatelessWidget {
  final RoadmapModel roadmap;

  const TopicDetailPage({super.key, required this.roadmap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070B14),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'DAY ${roadmap.day}',
          style: const TextStyle(color: Colors.cyan),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.cyan),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              roadmap.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Topics to Cover',
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            ...roadmap.tasks.map(
              (task) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                      size: 24,
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        task,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Coming Soon Sections
            _buildComingSoonSection('📚 Theory', Colors.blue),
            const SizedBox(height: 16),
            _buildComingSoonSection('💻 Code Examples', Colors.purple),
            const SizedBox(height: 16),
            _buildComingSoonSection('🎯 Practice Problems', Colors.orange),
            const SizedBox(height: 16),
            _buildComingSoonSection('✅ Quiz', Colors.green),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoonSection(String title, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: Colors.black26,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Coming Soon',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
