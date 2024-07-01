import 'package:kanban_app/features/kanban/domain/entities/deal_entity.dart';

class StageEntity {
  final int id;
  final String title;
  final List<DealEntity> deals;

  StageEntity({
    required this.id,
    required this.title,
    required this.deals,
  });
}
