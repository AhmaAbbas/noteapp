class AddNote_States{}
class AddNote_InitialStates extends AddNote_States{}
class AddNote_LoadingStates extends AddNote_States{}
class AddNote_SuccesStates extends AddNote_States{}
class AddNote_FailureStates extends AddNote_States{
  String? errormassege;
  AddNote_FailureStates({this.errormassege});
}