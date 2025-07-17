import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes/app/router/router.gr.dart';
import 'package:notes/domain/model/note.dart';
import 'package:notes/presentation/feature/home/widgets/single_note_box.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String path = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Note> notes = [];

  void _addNote(Note note) {
    setState(() => notes.add(note));
  }

  void _navigateToNotePage() async {
    final newNote = await context.pushRoute<Note>(
      NoteRoute(), 
    );

    if (newNote != null) {
      _addNote(newNote);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (_, index) => SingleNoteBox(note: notes[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToNotePage,
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}