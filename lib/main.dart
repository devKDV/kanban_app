import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kanban_app/features/kanban/data/data_sources/kanban_data_source.dart';
import 'package:kanban_app/features/kanban/data/repositories/kanban_repository.dart';
import 'package:kanban_app/features/kanban/domain/use_cases/get_kanban_data.dart';
import 'package:kanban_app/features/kanban/presentation/bloc/kanban_bloc.dart';
import 'package:kanban_app/features/kanban/presentation/pages/kanban_page.dart';

void main() {
  final kanbanDataSource = KanbanDataSource();
  final kanbanRepository = KanbanRepositoryImpl(kanbanDataSource);
  final getKanbanData = GetKanbanData(kanbanRepository);

  initializeDateFormatting()
      .then((_) => runApp(MyApp(getKanbanData: getKanbanData)));
}

class MyApp extends StatelessWidget {
  final GetKanbanData getKanbanData;

  const MyApp({
    super.key,
    required this.getKanbanData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KanbanBloc(getKanbanData),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            brightness: Brightness.light,
            primary: Colors.blue,
          ),
          useMaterial3: true,
        ),
        locale: const Locale('ru'),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Сделки',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: const KanbanBoardWidget(),
        ),
      ),
    );
  }
}
