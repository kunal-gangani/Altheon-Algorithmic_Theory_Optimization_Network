import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/progress_service.dart';
import '../../../topic_detail/pages/topic_detail_page.dart';
import '../bloc/roadmap_bloc.dart';
import '../bloc/roadmap_event.dart';
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
                  final currentDay = ProgressService.getCurrentDay();

                  final completedDays = roadmap
                      .where((e) => e.day < currentDay)
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

                            final completed = item.day < currentDay;
                            final active = item.day == currentDay;
                            final locked = item.day > currentDay;

                            return RoadmapCard(
                              day: 'DAY ${item.day}',
                              title: item.title,
                              tasks: item.tasks,
                              active: active,
                              completed: completed,
                              onComplete: active
                                  ? () async {
                                      await ProgressService.completeDay(
                                        item.day,
                                      );
                                      if (context.mounted) {
                                        context.read<RoadmapBloc>().add(
                                          LoadRoadmap(),
                                        );
                                      }
                                    }
                                  : null,
                              onTap: (active || completed)
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              TopicDetailPage(roadmap: item),
                                        ),
                                      );
                                    }
                                  : null,
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
