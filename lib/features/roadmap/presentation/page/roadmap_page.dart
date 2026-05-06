import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/roadmap_bloc.dart';
import '../bloc/roadmap_state.dart';

import '../widgets/background_design.dart';
import '../widgets/roadmap_card.dart';
import '../widgets/top_section.dart';

class RoadmapPage extends StatelessWidget {
  const RoadmapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070B14),

      body: Stack(
        children: [
          const BackgroundDesign(),

          SafeArea(
            child: BlocBuilder<RoadmapBloc, RoadmapState>(
              builder: (context, state) {
                if (state is RoadmapLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is RoadmapError) {
                  return Center(child: Text(state.message));
                }

                if (state is RoadmapLoaded) {
                  final roadmap = state.roadmap;

                  final completedDays = roadmap
                      .where((e) => e.isCompleted)
                      .length;

                  final totalDays = roadmap.length;

                  final progress = completedDays / totalDays;

                  return Column(
                    children: [
                      TopSection(
                        completedDays: completedDays,
                        totalDays: totalDays,
                        progress: progress,
                      ),

                      Expanded(
                        child: ListView.builder(
                          itemCount: roadmap.length,

                          itemBuilder: (context, index) {
                            final item = roadmap[index];

                            return RoadmapCard(
                              day: 'DAY ${item.day}',

                              title: item.title,

                              status: item.status,

                              tasks: item.tasks,

                              active: item.isActive,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
