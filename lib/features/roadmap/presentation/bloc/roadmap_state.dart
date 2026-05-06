import '../../data/models/roadmap_model.dart';

abstract class RoadmapState {}

class RoadmapInitial extends RoadmapState {}

class RoadmapLoading extends RoadmapState {}

class RoadmapLoaded extends RoadmapState {
  final List<RoadmapModel> roadmap;

  RoadmapLoaded(this.roadmap);
}

class RoadmapError extends RoadmapState {
  final String message;

  RoadmapError(this.message);
}
