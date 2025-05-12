import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_x/blocs/notes/notes_cubit.dart';
import 'package:habit_x/blocs/notes/notes_state.dart';

class NoteItemPage extends StatefulWidget {
  const NoteItemPage({super.key, required this.name, required this.notesCubit});
  final String name;
  final NotesCubit notesCubit;

  @override
  State<NoteItemPage> createState() => _NoteItemPageState();
}

class _NoteItemPageState extends State<NoteItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: BlocProvider.value(
        value: widget.notesCubit,
        child: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            final notes =
                state.notes
                    .where((note) => note.category == widget.name)
                    .toList();
            if (notes.isEmpty) {
              return const Center(
                child: Text(
                  'No notes available in this category.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(
                          0,
                          3,
                        ), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    iconColor: Colors.black,
                    textColor: Colors.black,
                    title: Text(
                      notes[index].title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(notes[index].content),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        widget.notesCubit.removeNoteAt(state.notes[index].id);
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
