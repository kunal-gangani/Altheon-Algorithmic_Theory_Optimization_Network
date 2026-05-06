import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/roadmap_repository.dart';

import 'roadmap_event.dart';
import 'roadmap_state.dart';

class RoadmapBloc extends Bloc<RoadmapEvent, RoadmapState> {
  final RoadmapRepository repository;

  RoadmapBloc(this.repository) : super(RoadmapInitial()) {
    on<LoadRoadmap>(_onLoadRoadmap);
  }

  Future<void> _onLoadRoadmap(
    LoadRoadmap event,
    Emitter<RoadmapState> emit,
  ) async {
    try {
      emit(RoadmapLoading());

      final roadmap = await repository.fetchRoadmap();

      emit(RoadmapLoaded(roadmap));
    } catch (e) {
      emit(RoadmapError(e.toString()));
    }
  }
}
