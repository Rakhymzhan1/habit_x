import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_x/blocs/notes/notes_state.dart';
import 'package:habit_x/entities/notes_entity.dart';

class NotesCubit extends Cubit<NotesState>{
  NotesCubit():super(const NotesState());
  void addNote(String title, String description, String category) {
    final note = NotesEntity(
      id: DateTime.now().toString(),
      title: title,
      content: description, 
      category: category,
    );
    final updatedNotes = List<NotesEntity>.from(state.notes)..add(note);
    emit(state.copyWith(notes: updatedNotes));
  }
  void removeNoteAt(String  id) {
    final index = state.notes.indexWhere((note) => note.id == id);
    if (index == -1) return; // Note not found  
    final updatedNotes = List<NotesEntity>.from(state.notes)
      ..removeWhere((val) => val.id == id);
    emit(state.copyWith(notes: updatedNotes));
  }

}