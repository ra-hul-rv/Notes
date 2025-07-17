import 'package:flutter/material.dart';
import 'package:notes/domain/model/note.dart';


class SingleNoteBox extends StatelessWidget {
  final Note note;
  const SingleNoteBox({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final formattedDate = note.date;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(note.title, style: const TextStyle(fontWeight: FontWeight.bold))),
                Text(
                  formattedDate,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              note.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
