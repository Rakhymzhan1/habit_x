class TodoEntity {
  final String id;
  final String task;
  final bool isPriority;
  final DateTime deadline;
  final bool isCompleted;

  TodoEntity({required this.id, required this.task, required this.isPriority, required this.deadline, required this.isCompleted});
}
