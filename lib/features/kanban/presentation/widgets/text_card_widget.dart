import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kanban_app/features/kanban/domain/entities/deal_entity.dart';

class TextCardWidget extends StatelessWidget {
  final DealEntity item;
  const TextCardWidget({
    super.key,
    required this.item,
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
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 30),
            Text(
              DateFormat('dd MMMM', 'ru').format(item.date),
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
