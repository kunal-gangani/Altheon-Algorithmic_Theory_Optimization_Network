import 'dart:ui';

import 'package:flutter/material.dart';

class RoadmapPage extends StatelessWidget {
  const RoadmapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final roadmap = [
      {
        'day': 'DAY 16',
        'title': 'StringBuilder',
        'status': 'ACTIVE',
        'tasks': [
          'append() optimization',
          'reverse() usage',
          'Efficient string building',
        ],
        'active': true,
      },
      {
        'day': 'DAY 17',
        'title': 'String Traversal',
        'status': 'LOCKED',
        'tasks': ['Palindrome check', 'Anagram validation'],
        'active': false,
      },
      {
        'day': 'DAY 18',
        'title': 'String Rotation',
        'status': 'LOCKED',
        'tasks': ['Rotation logic', 'Cyclic patterns'],
        'active': false,
      },
      {
        'day': 'DAY 19',
        'title': 'Prefix Sum',
        'status': 'LOCKED',
        'tasks': ['Range sum queries', 'Difference arrays'],
        'active': false,
      },
      {
        'day': 'DAY 20',
        'title': '2D Arrays',
        'status': 'LOCKED',
        'tasks': ['Matrix traversal', 'Spiral traversal'],
        'active': false,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF070B14),
      body: Stack(
        children: [
          const _BackgroundDesign(),

          SafeArea(
            child: Column(
              children: [
                const _TopSection(),

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    itemCount: roadmap.length,
                    itemBuilder: (context, index) {
                      final item = roadmap[index];

                      return _RoadmapCard(
                        day: item['day'] as String,
                        title: item['title'] as String,
                        status: item['status'] as String,
                        tasks: item['tasks'] as List<String>,
                        active: item['active'] as bool,
                        isFirst: index == 0,
                        isLast: index == roadmap.length - 1,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 24,
            right: 24,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF00FFFF).withValues(alpha: 0.12),
                border: Border.all(color: const Color(0xFF00FFFF), width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF00FFFF),
                    blurRadius: 30,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.graphic_eq_rounded,
                color: Color(0xFF00FFFF),
                size: 34,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopSection extends StatelessWidget {
  const _TopSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF00FFFF), width: 2),
                  boxShadow: const [
                    BoxShadow(color: Color(0xFF00FFFF), blurRadius: 20),
                  ],
                ),
                child: const Icon(Icons.person, color: Colors.white),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.08),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'TOPIC PROGRESS',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 14),

                          Stack(
                            children: [
                              Container(
                                height: 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white10,
                                ),
                              ),

                              Container(
                                height: 12,
                                width: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFF00FFFF),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFF00FFFF),
                                      blurRadius: 18,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            'Day 16 / 150 Completed',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RoadmapCard extends StatelessWidget {
  final String day;
  final String title;
  final String status;
  final List<String> tasks;
  final bool active;
  final bool isFirst;
  final bool isLast;

  const _RoadmapCard({
    required this.day,
    required this.title,
    required this.status,
    required this.tasks,
    required this.active,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final accent = active ? const Color(0xFF00FFFF) : Colors.grey.shade700;

    return SizedBox(
      height: 240,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Column(
              children: [
                if (!isFirst)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: accent.withValues(alpha: 0.4),
                    ),
                  ),

                Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accent,
                    boxShadow: active
                        ? const [
                            BoxShadow(
                              color: Color(0xFF00FFFF),
                              blurRadius: 18,
                              spreadRadius: 2,
                            ),
                          ]
                        : [],
                  ),
                ),

                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: accent.withValues(alpha: 0.4),
                    ),
                  ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: active
                            ? const Color(0xFF00FFFF)
                            : Colors.white.withValues(alpha: 0.08),
                        width: 1.5,
                      ),
                      boxShadow: active
                          ? const [
                              BoxShadow(
                                color: Color(0xFF00FFFF),
                                blurRadius: 28,
                                spreadRadius: -6,
                              ),
                            ]
                          : [],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: active
                                ? const Color(
                                    0xFF00FFFF,
                                  ).withValues(alpha: 0.15)
                                : Colors.grey.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: active
                                  ? const Color(0xFF00FFFF)
                                  : Colors.grey,
                            ),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              color: active
                                  ? const Color(0xFF00FFFF)
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        Text(
                          day,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 18),

                        ...tasks.map(
                          (task) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                  active ? Icons.check_circle : Icons.lock,
                                  color: active
                                      ? const Color(0xFF00FF41)
                                      : Colors.grey,
                                  size: 18,
                                ),

                                const SizedBox(width: 12),

                                Expanded(
                                  child: Text(
                                    task,
                                    style: TextStyle(
                                      color: active
                                          ? Colors.white
                                          : Colors.white54,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const Spacer(),

                        Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.account_tree_rounded,
                            size: 54,
                            color: active
                                ? const Color(0xFF00FFFF)
                                : Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundDesign extends StatelessWidget {
  const _BackgroundDesign();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF070B14), Color(0xFF0F172A), Color(0xFF020617)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),

        Positioned.fill(
          child: Opacity(
            opacity: 0.03,
            child: GridPaper(
              color: Colors.white,
              divisions: 2,
              subdivisions: 1,
            ),
          ),
        ),

        Positioned(
          top: 120,
          left: -50,
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF00FFFF),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF00FFFF),
                  blurRadius: 180,
                  spreadRadius: 40,
                ),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 100,
          right: -80,
          child: Container(
            height: 220,
            width: 220,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF00FFFF),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF00FFFF),
                  blurRadius: 180,
                  spreadRadius: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
