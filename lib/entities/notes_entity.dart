class NotesEntity {
  final String id; // Unique identifier for the note
  final String title; // Title of the note
  final String content; // Content of the note
  final String category; // Category of the note (optional)

  NotesEntity({
    required this.category,
    required this.id,
    required this.title,
    required this.content,
  });
}
