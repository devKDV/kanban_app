import 'package:appflowy_board/appflowy_board.dart';
import 'package:kanban_app/features/kanban/domain/entities/stage_entity.dart';
import 'package:kanban_app/features/kanban/presentation/adapters/deal_model_adapter.dart';

class StageModelAdapter extends AppFlowyGroupData<void> {
  StageModelAdapter(StageEntity stage)
      : super(
          id: stage.id.toString(),
          name: stage.title,
          items: List<AppFlowyGroupItem>.from(
            stage.deals.map((deal) => DealModelAdapter(deal: deal)),
          ),
        );
}
