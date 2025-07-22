import 'package:flutter/material.dart';
import 'package:notes/domain/model/note.dart';

class SingleNoteBox extends StatefulWidget {
  final Note note;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const SingleNoteBox({
    super.key,
    required this.note,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<SingleNoteBox> createState() => _SingleNoteBoxState();
}

class _SingleNoteBoxState extends State<SingleNoteBox> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final note = widget.note;
    final formattedDate = note.date;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () => setState(() => _expanded = !_expanded),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                note.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),

              // Content (expandable)
              Text(
                note.content,
                maxLines: _expanded ? null : 2,
                overflow:
                    _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),

              // Footer: edit + delete on left, date on right
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Color.fromRGBO(117, 117, 117, 1),
                        ),
                        onPressed: widget.onEdit,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 224, 148, 155),
                        ),
                        onPressed: widget.onDelete,
                      ),
                    ],
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
