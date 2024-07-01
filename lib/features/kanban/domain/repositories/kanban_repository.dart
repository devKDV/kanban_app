import 'package:kanban_app/features/kanban/domain/entities/stage_entity.dart';

abstract class KanbanRepository {
  Future<List<StageEntity>> getKanbanData();
}
