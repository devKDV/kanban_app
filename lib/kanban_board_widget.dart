import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:kanban_app/text_card_widget.dart';
import 'package:kanban_app/text_item_model.dart';

class KanbanBoardWidget extends StatefulWidget {
  const KanbanBoardWidget({super.key});

  @override
  State<KanbanBoardWidget> createState() => _KanbanBoardWidgetState();
}

class _KanbanBoardWidgetState extends State<KanbanBoardWidget> {
  final AppFlowyBoardController controller = AppFlowyBoardController();
  late AppFlowyBoardScrollController boardController;

  @override
  void initState() {
    super.initState();

    boardController = AppFlowyBoardScrollController();
    final group1 = AppFlowyGroupData(
      id: "1",
      name: "Стадия 1",
      items: [
        TextItemModel(
          idDeal: 1,
          title: 'Сделка 1',
          date: '15 мая',
          manager: 'Иванов И.И.',
        ),
        TextItemModel(
          idDeal: 2,
          title: 'Сделка 2',
          date: '23 апреля',
          manager: 'Петров П.П.',
        ),
        TextItemModel(
          idDeal: 3,
          title: 'Сделка 3',
          date: '01 июня',
          manager: 'Сидоров С.С.',
        ),
      ],
    );

    final group2 = AppFlowyGroupData(
      id: "2",
      name: "Стадия 2",
      items: [
        TextItemModel(
          idDeal: 4,
          title: 'Сделка 4',
          date: '05 июля',
          manager: 'Кузнецов К.К.',
        ),
      ],
    );

    controller.addGroup(group1);
    controller.addGroup(group2);
  }

  @override
  Widget build(BuildContext context) {
    const config = AppFlowyBoardConfig(
      groupMargin: EdgeInsets.symmetric(horizontal: 0),
    );
    return AppFlowyBoard(
      controller: controller,
      cardBuilder: (context, group, groupItem) {
        return AppFlowyGroupCard(
          key: ValueKey(groupItem.id),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                offset: Offset(0, 8),
                blurRadius: 16,
                spreadRadius: 0,
              ),
            ],
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.4),
            //     spreadRadius: 2,
            //     blurRadius: 4,
            //     offset: Offset(0, 3),
            //   ),
            // ],
          ),
          child: _buildCard(groupItem),
        );
      },
      headerBuilder: (context, columnData) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppFlowyGroupHeader(
                  title: Text(
                    columnData.headerData.groupName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  height: 55,
                  margin: config.groupBodyPadding,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: Text(
                    columnData.items.length.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      groupConstraints: const BoxConstraints.tightFor(width: 300),
      config: config,
    );
  }

  Widget _buildCard(AppFlowyGroupItem item) {
    if (item is TextItemModel) {
      return TextCardWidget(item: item);
    }

    throw UnimplementedError();
  }
}