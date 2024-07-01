import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/features/kanban/presentation/adapters/deal_model_adapter.dart';
import 'package:kanban_app/features/kanban/presentation/adapters/stage_model_adapter.dart';
import 'package:kanban_app/features/kanban/presentation/bloc/kanban_bloc.dart';
import 'package:kanban_app/features/kanban/presentation/bloc/kanban_event.dart';
import 'package:kanban_app/features/kanban/presentation/bloc/kanban_state.dart';
import 'package:kanban_app/features/kanban/presentation/widgets/text_card_widget.dart';

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
    context.read<KanbanBloc>().add(LoadKanbanData());
  }

  @override
  Widget build(BuildContext context) {
    const config = AppFlowyBoardConfig(
      groupMargin: EdgeInsets.symmetric(horizontal: 0),
    );
    return BlocBuilder<KanbanBloc, KanbanState>(
      builder: (context, state) {
        if (state is KanbanLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is KanbanLoaded) {
          for (var stage in state.stages) {
            controller.addGroup(StageModelAdapter(stage));
          }
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
                ),
                child: _buildCard(groupItem),
              );
            },
            headerBuilder: (context, columnData) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
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
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
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
        } else if (state is KanbanError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Неизвестное состояние'));
        }
      },
    );
  }

  Widget _buildCard(AppFlowyGroupItem item) {
    if (item is DealModelAdapter) {
      return TextCardWidget(item: item.deal);
    }

    throw UnimplementedError();
  }
}
