class Note {
  final String id;
  final String title;
  final String content;
  final String date;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
  });

  factory Note.fromMap(Map<String, dynamic> data, String documentId) {
    return Note(
      id: documentId,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      date: data['date'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'content': content, 'date': date};
  }
}
