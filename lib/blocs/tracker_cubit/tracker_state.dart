import 'package:equatable/equatable.dart';
import 'package:habit_x/entities/tracker_item_entity.dart';

class TrackerState extends Equatable{
  final List<TrackerItemEntity> trackerItems;
  final TrackerStatus status;
  final String errorMessage;

  const TrackerState({
    this.trackerItems = const [],
    this.status = TrackerStatus.initial,
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [trackerItems, status, errorMessage];

  TrackerState copyWith({
    List<TrackerItemEntity>? trackerItems,
    TrackerStatus? status,
    String? errorMessage,
  }) {
    return TrackerState(
      trackerItems: trackerItems ?? this.trackerItems,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }


}

enum TrackerStatus {
  initial,
  loading,
  loaded,
  error,
}