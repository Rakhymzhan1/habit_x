import 'package:equatable/equatable.dart';
import 'package:habit_x/entities/notes_entity.dart';

class NotesState extends Equatable{
  final List<NotesEntity> notes;
  final String errorMessage;

  const NotesState({
    this.notes = const [],
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [notes, errorMessage];

  NotesState copyWith({
    List<NotesEntity>? notes,
    String? errorMessage,
  }) {
    return NotesState(
      notes: notes ?? this.notes,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

}