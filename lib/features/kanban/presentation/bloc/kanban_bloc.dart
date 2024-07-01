import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/features/kanban/domain/use_cases/get_kanban_data.dart';
import 'package:kanban_app/features/kanban/presentation/bloc/kanban_event.dart';
import 'package:kanban_app/features/kanban/presentation/bloc/kanban_state.dart';

class KanbanBloc extends Bloc<KanbanEvent, KanbanState> {
  final GetKanbanData getKanbanData;

  KanbanBloc(this.getKanbanData) : super(KanbanInitial()) {
    on<LoadKanbanData>(_onLoadKanbanData);
  }

  void _onLoadKanbanData(
      LoadKanbanData event, Emitter<KanbanState> emit) async {
    emit(KanbanLoading());
    try {
      final stages = await getKanbanData();
      emit(KanbanLoaded(stages));
    } catch (e) {
      emit(KanbanError(e.toString()));
    }
  }
}
