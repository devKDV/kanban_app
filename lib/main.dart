import 'package:flutter/material.dart';
import 'package:kanban_app/kanban_board_widget.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: Colors.blue,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          surfaceTintColor: Colors.transparent,
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
    );
  }
}
