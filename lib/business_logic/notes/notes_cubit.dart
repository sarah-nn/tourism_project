import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/notes_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NotesModel> notesList = [];
  var data = [];

  Future<List<NotesModel>> getAllNotes() async {
    var uri = Uri.parse(EndPoint.getAllNotes);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(NotesLoading());
      if (response.statusCode == 200) {
        print(response.body);
        data = json.decode(response.body)['data'];
        notesList = data.map((e) => NotesModel.fromJson(e)).toList();

        print(notesList);
        emit(NotesSuccess(notesList: notesList));
      } else {
        print("api error${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
      print("exception in notes ");
      emit(NotesFail(errMessage: e.toString()));
    }
    return notesList;
  }
}
