import 'package:noteapp/note_model/note_model.dart';

class Note_States{}
class Note_InitialStates extends Note_States{}
class Note_LoadingStates extends Note_States{}
class Note_SuccesStates extends Note_States{
  List<Note_Model> notes=[];
  Note_SuccesStates({required this.notes});
}
class Note_FailureStates extends Note_States{
  String? errormassege;
  Note_FailureStates({this.errormassege});
}