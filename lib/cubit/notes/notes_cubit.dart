import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Widgets/consts.dart';
import 'package:noteapp/note_model/note_model.dart';

import 'notes_states.dart';


class Notes_Cubit extends Cubit<Note_States>{
  Notes_Cubit():super(Note_InitialStates());
  List<Note_Model>?notes;
  fetchnotes()async{
    try{
      var notesbox=Hive.box<Note_Model>(knotesbox);
      notes=notesbox.values.toList();
      emit(Note_SuccesStates(notes:notes!));
    }catch(error){
      emit(Note_FailureStates(errormassege: error.toString()));
    }
  }

}