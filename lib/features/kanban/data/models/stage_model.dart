
import 'package:kanban_app/features/kanban/data/models/deal_model.dart';
import 'package:kanban_app/features/kanban/domain/entities/stage_entity.dart';

class StageModel extends StageEntity {
  StageModel({
    required super.id,
    required super.title,
    required List<DealModel> deals,
  }) : super(deals: deals);

  factory StageModel.fromJson(Map<String, dynamic> json) {
    var dealsFromJson = json['deals'] as List;
    List<DealModel> dealList =
        dealsFromJson.map((dealJson) => DealModel.fromJson(dealJson)).toList();

    return StageModel(
      id: json['id'],
      title: json['title'],
      deals: dealList,
    );
  }
}
