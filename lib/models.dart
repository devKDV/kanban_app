import 'package:appflowy_board/appflowy_board.dart';
import 'package:intl/intl.dart';

class DealModel {
  final int id;
  final String title;
  final DateTime date;
  final String manager;

  DealModel({
    required this.id,
    required this.title,
    required this.date,
    required this.manager,
  });

  factory DealModel.fromJson(Map<String, dynamic> json) {
    final DateFormat dateFormat = DateFormat('dd MMMM', 'ru');
    final DateTime parsedDate = dateFormat.parse(json['date']);
    final DateTime dateWithCurrentYear =
        DateTime(DateTime.now().year, parsedDate.month, parsedDate.day);

    return DealModel(
      id: json['id'],
      title: json['title'],
      date: dateWithCurrentYear,
      manager: json['manager'],
    );
  }
}

class StageModel {
  final int id;
  final String title;
  final List<DealModel> deals;

  StageModel({
    required this.id,
    required this.title,
    required this.deals,
  });

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

class DealModelAdapter extends AppFlowyGroupItem {
  final DealModel deal;

  DealModelAdapter({required this.deal});

  @override
  String get id => deal.id.toString();
}

class StageModelAdapter extends AppFlowyGroupData<void> {
  StageModelAdapter(StageModel stage)
      : super(
          id: stage.id.toString(),
          name: stage.title,
          items: List<AppFlowyGroupItem>.from(
            stage.deals.map((deal) => DealModelAdapter(deal: deal)),
          ),
        );
}
