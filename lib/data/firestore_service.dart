import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/domain/model/note.dart';

class FirestoreService {
  final _notesRef = FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(Note note) async {
    await _notesRef.add(note.toMap());
  }

  Stream<List<Note>> getNotes() {
    return _notesRef
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => Note.fromMap(doc.data(), doc.id))
                  .toList(),
        );
  }

  Future<void> updateNote(Note note) async {
    await _notesRef.doc(note.id).update(note.toMap());
  }

  Future<void> deleteNote(String id) async {
    await _notesRef.doc(id).delete();
  }
}
