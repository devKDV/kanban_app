import 'package:appflowy_board/appflowy_board.dart';
import 'package:kanban_app/features/kanban/domain/entities/deal_entity.dart';

class DealModelAdapter extends AppFlowyGroupItem {
  final DealEntity deal;

  DealModelAdapter({required this.deal});

  @override
  String get id => deal.id.toString();
}
