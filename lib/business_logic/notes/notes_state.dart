part of 'notes_cubit.dart';

sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesSuccess extends NotesState {
  final List<NotesModel> notesList;

  NotesSuccess({required this.notesList});
}

final class NotesLoading extends NotesState {}

final class NotesFail extends NotesState {
  final String errMessage;

  NotesFail({required this.errMessage});
}
