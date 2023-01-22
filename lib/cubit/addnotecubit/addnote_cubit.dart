
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Widgets/consts.dart';
import 'package:noteapp/note_model/note_model.dart';

import 'addnote_States.dart';

class AddNote_Cubit extends Cubit<AddNote_States>{
  AddNote_Cubit():super(AddNote_InitialStates());
  Color color=const Color(0xff2B193D);
  addnote(Note_Model note)async{
    note.color=color!.value;
    emit(AddNote_LoadingStates());
    try{
      var notesbox=Hive.box<Note_Model>(knotesbox);
      await notesbox.add(note);
      emit(AddNote_SuccesStates());
    }catch(error){
      emit(AddNote_FailureStates(errormassege: error.toString()));
    }
  }

}