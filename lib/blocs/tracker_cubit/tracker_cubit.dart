import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_x/blocs/tracker_cubit/tracker_state.dart';
import 'package:habit_x/entities/tracker_item_entity.dart';

class TrackerCubit extends Cubit<TrackerState>{
  TrackerCubit() : super(TrackerState());

  void addTrackerItem({
    required String name,
    required List<bool> daysOfWeek,
  }) {
    emit(state.copyWith(status: TrackerStatus.loading));
    // Simulate a delay for loading state
    Future.delayed(const Duration(seconds: 1), () {});
    final trackerItem = TrackerItemEntity(
      id: DateTime.now().toString(),
      name: name,
      daysOfWeek: daysOfWeek,
    );
    final updatedTrackerItems = List<TrackerItemEntity>.from(state.trackerItems)..add(trackerItem);
    emit(state.copyWith(trackerItems: updatedTrackerItems, status: TrackerStatus.loaded));
  }
}