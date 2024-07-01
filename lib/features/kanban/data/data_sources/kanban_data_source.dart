import 'dart:convert';
import 'package:kanban_app/features/kanban/data/models/stage_model.dart';

class KanbanDataSource {
  Future<List<StageModel>> fetchKanbanData() async {
    String jsonData = '''
    {
      "stages": [
        {
          "id": 1,
          "title": "Стадия 1",
          "deals": [
            {
              "id": 1,
              "title": "Сделка 1",
              "date": "15 мая",
              "manager": "Иванов И.И."
            },
            {
              "id": 2,
              "title": "Сделка 2",
              "date": "23 апреля",
              "manager": "Петров П.П."
            },
            {
              "id": 3,
              "title": "Сделка 3",
              "date": "01 июня",
              "manager": "Сидоров С.С."
            }
          ]
        },
        {
          "id": 2,
          "title": "Стадия 2",
          "deals": [
            {
              "id": 4,
              "title": "Сделка 4",
              "date": "05 июля",
              "manager": "Кузнецов К.К."
            }
          ]
        }
      ]
    }
    ''';

    await Future.delayed(
        const Duration(milliseconds: 200)); // Имитация задержки
    Map<String, dynamic> jsonMap = jsonDecode(jsonData);
    List<StageModel> stages = (jsonMap['stages'] as List)
        .map((stageJson) => StageModel.fromJson(stageJson))
        .toList();

    return stages;
  }
}
