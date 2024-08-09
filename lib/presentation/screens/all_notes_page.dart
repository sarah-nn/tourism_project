import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/notes/notes_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/notes_model.dart';
import 'package:tourism_project/presentation/widget/all_notes/all_notes_card.dart';

class AllNotesPage extends StatefulWidget {
  const AllNotesPage({super.key});

  @override
  State<AllNotesPage> createState() => _AllNotesPageState();
}

class _AllNotesPageState extends State<AllNotesPage> {
  List<NotesModel> notes = [];

  @override
  void initState() {
    super.initState();
    context.read<NotesCubit>().getAllNotes();
  }

//  void isDynamic(){
//   return notes.singleWhere((element) => element.type == 'plane').t
//  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NotesSuccess) {
          notes = (state).notesList;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            title: const Text("My Notes"),
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(40))),
          ),
          body: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return AllNotesCard(model: notes[index]);
              }),
        );
      },
    );
  }
}
