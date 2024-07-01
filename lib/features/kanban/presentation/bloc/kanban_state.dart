import 'package:kanban_app/features/kanban/domain/entities/stage_entity.dart';

abstract class KanbanState {}

class KanbanInitial extends KanbanState {}

class KanbanLoading extends KanbanState {}

class KanbanLoaded extends KanbanState {
  final List<StageEntity> stages;

  KanbanLoaded(this.stages);
}

class KanbanError extends KanbanState {
  final String message;

  KanbanError(this.message);
}
