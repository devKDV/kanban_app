import 'package:kanban_app/features/kanban/domain/entities/stage_entity.dart';
import 'package:kanban_app/features/kanban/domain/repositories/kanban_repository.dart';

class GetKanbanData {
  final KanbanRepository repository;

  GetKanbanData(this.repository);

  Future<List<StageEntity>> call() async {
    return await repository.getKanbanData();
  }
}
