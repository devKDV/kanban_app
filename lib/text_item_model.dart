import 'package:appflowy_board/appflowy_board.dart';

class TextItemModel extends AppFlowyGroupItem {
  final int idDeal;
  final String title;
  final String date;
  final String manager;

  TextItemModel({
    required this.idDeal,
    required this.title,
    required this.date,
    required this.manager,
  });

  @override
  String get id => title;
}
