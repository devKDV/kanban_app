import 'package:kanban_app/features/kanban/data/data_sources/kanban_data_source.dart';
import 'package:kanban_app/features/kanban/domain/entities/stage_entity.dart';
import 'package:kanban_app/features/kanban/domain/repositories/kanban_repository.dart';

class KanbanRepositoryImpl implements KanbanRepository {
  final KanbanDataSource dataSource;

  KanbanRepositoryImpl(this.dataSource);

  @override
  Future<List<StageEntity>> getKanbanData() async {
    final stages = await dataSource.fetchKanbanData();
    return stages;
  }
}
