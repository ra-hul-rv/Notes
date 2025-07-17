import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes/domain/model/note.dart';
import 'package:notes/presentation/common/btn/custom_button.dart';

@RoutePage()
class NotePage extends StatelessWidget {
  NotePage({super.key});
  static const String path = '/note';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'Content'),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: 'Save Note',
              onPressed: () {
                final title = _titleController.text.trim();
                final content = _contentController.text.trim();

                if (title.isNotEmpty || content.isNotEmpty) {
                  final note = Note(
                    title: title,
                    content: content,
                    date: DateTime.now().toIso8601String(),
                  );
                  context.router.maybePop(note);
                } else {
                  context.router.maybePop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
