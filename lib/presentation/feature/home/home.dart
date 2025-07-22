import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes/app/router/router.gr.dart';
import 'package:notes/data/firestore_service.dart';
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
  final _firestoreService = FirestoreService();

  void _navigateToNotePage() async {
    await context.pushRoute(NoteRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsetsGeometry.directional(top: 30),
          child: Text(
            'Notes',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.directional(top: 50),
        child: StreamBuilder<List<Note>>(
          stream: _firestoreService.getNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final notes = snapshot.data ?? [];
            if (notes.isEmpty) {
              return const Center(
                child: Text(
                  'No notes yet.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
            }
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder:
                  (_, index) => Dismissible(
                    key: ValueKey(notes[index].id),
                    background: Container(color: Colors.red),
                    onDismissed:
                        (_) => _firestoreService.deleteNote(notes[index].id),
                    child: SingleNoteBox(
                      note: notes[index],
                      onEdit: () {
                        context.pushRoute(NoteRoute(note: notes[index]));
                      },
                      onDelete: () {
                        _firestoreService.deleteNote(notes[index].id);
                      },
                    ),
                  ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToNotePage,
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
