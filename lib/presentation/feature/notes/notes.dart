import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes/data/firestore_service.dart';
import 'package:notes/domain/model/note.dart';

@RoutePage()
class NotePage extends StatefulWidget {
  static const String path = '/notes';

  final Note? note;
  const NotePage({super.key, this.note});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final _firestoreService = FirestoreService();
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController = TextEditingController(
      text: widget.note?.content ?? '',
    );
    super.initState();
  }

  void _saveNote() async {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    if (title.isEmpty && content.isEmpty) {
      Navigator.of(context).pop();
      return;
    }

    final date = DateTime.now().toIso8601String();

    if (widget.note != null) {
      final updatedNote = Note(
        id: widget.note!.id,
        title: title,
        content: content,
        date: date,
      );
      await _firestoreService.updateNote(updatedNote);
    } else {
      final newNote = Note(
        id: '', // Firestore assigns ID
        title: title,
        content: content,
        date: date,
      );
      await _firestoreService.addNote(newNote);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.note != null ? 'Edit Note' : 'Add Note',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                hintText: 'Enter title',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFF7A5FFF),
                    width: 2,
                  ),
                ),
                hintStyle: TextStyle(color: Colors.grey.shade500),
                // Optionally add shadow
                // filled: true,
                // fillColor: Colors.grey.shade100,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _contentController,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Write your note here...',
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFF7A5FFF),
                    width: 2,
                  ),
                ),
                hintStyle: TextStyle(color: Colors.grey.shade500),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveNote,
              child: const Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }
}
