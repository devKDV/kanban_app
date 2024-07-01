import 'package:intl/intl.dart';
import 'package:kanban_app/features/kanban/domain/entities/deal_entity.dart';

class DealModel extends DealEntity {
  DealModel({
    required super.id,
    required super.title,
    required super.date,
    required super.manager,
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
