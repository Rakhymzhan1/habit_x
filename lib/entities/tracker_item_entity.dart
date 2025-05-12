import 'package:equatable/equatable.dart';

class TrackerItemEntity extends Equatable {
  final String id;
  final String name;
  final List<bool> daysOfWeek;

  const TrackerItemEntity({
    required this.daysOfWeek,
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name, daysOfWeek];
}
