import 'package:flutter/material.dart';
import 'package:kanban_app/text_item_model.dart';

class TextCardWidget extends StatelessWidget {
  final TextItemModel item;
  const TextCardWidget({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 30),
            Text(
              item.date,
              style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
            ),
            Text(
              'Менеджер: ${item.manager}',
              style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Дела',
                  style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Запланировать',
                    style: TextStyle(fontSize: 14, color: Color(0xFF1648D8)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
