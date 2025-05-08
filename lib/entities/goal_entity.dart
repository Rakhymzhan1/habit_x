class GoalEntity {
  final String id;
  final String name;
  final String startDate;
  final String endDate;

  GoalEntity({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
  });
  factory GoalEntity.empty() {
    return GoalEntity(
      id: 'dede',
      name: 'Make a habit',
      startDate: '2023/10/01',
      endDate: '2023/10/31',
    );
  }
}
