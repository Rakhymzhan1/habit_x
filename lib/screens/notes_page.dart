import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_x/blocs/notes/notes_cubit.dart';
import 'package:habit_x/blocs/notes/notes_state.dart';
import 'package:habit_x/screens/note_item_page.dart';
import 'package:habit_x/widgets/custom_float_button.dart';
import 'package:habit_x/widgets/custom_text_form_field.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final noteFolders = ['Diary', 'Work', 'Study', 'Personal'];
  final cubit = NotesCubit(); // Assuming you have a NotesCubit defined
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: cubit,
        child: BlocBuilder<NotesCubit, NotesState>(
          bloc: cubit,
          builder: (context, state) {
            return ListView.builder(
              itemCount: noteFolders.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => NoteItemPage(
                                name: noteFolders[index],
                                notesCubit: cubit,
                              ),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 0,
                    ),
                    style: ListTileStyle.list,
                    leading: Icon(Icons.folder_open_rounded),
                    textColor: Colors.black,
                    iconColor: Colors.black,
                    trailing: IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {
                        // Handle delete action
                        cubit.removeNoteAt(state.notes[index].id);
                      },
                    ),
                    title: Text(
                      noteFolders[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        icon: Icon(Icons.add),
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (context) {
              return AddNoteModal(noteFolders: noteFolders, cubit: cubit);
            },
          );
        },
      ),
    );
  }
}

class AddNoteModal extends StatefulWidget {
  const AddNoteModal({
    super.key,
    required this.noteFolders,
    required this.cubit,
  });
  final List<String> noteFolders;
  final NotesCubit cubit;

  @override
  State<AddNoteModal> createState() => _AddNoteModalState();
}

class _AddNoteModalState extends State<AddNoteModal> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String selectedCategory = 'Diary'; // Default category
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(hintText: 'Title', controller: titleController),
          SizedBox(height: 10),
          CustomTextFormField(
            hintText: 'Description',
            controller: descriptionController,
          ),
          SizedBox(height: 10),
          DropdownButton<String>(
            isExpanded: true,
            value: selectedCategory,
            elevation: 0,
            items:
                widget.noteFolders
                    .map(
                      (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
                    )
                    .toList(),
            onChanged: (e) {
              selectedCategory = e!;
              setState(() {});
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                // Add note logic
                widget.cubit.addNote(
                  titleController.text,
                  descriptionController.text,
                  selectedCategory,
                );
                Navigator.pop(context);
              },
              child: Text('Add Note'),
            ),
          ),
        ],
      ),
    );
  }
}
