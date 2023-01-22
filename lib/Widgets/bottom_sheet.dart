import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:noteapp/cubit/addnotecubit/addnote_States.dart';
import 'package:noteapp/cubit/addnotecubit/addnote_cubit.dart';
import 'package:noteapp/cubit/notes/notes_cubit.dart';

import 'addnoteform.dart';
import 'custom_button.dart';
import 'custom_textformfeild.dart';

class Note_Bottomsheet extends StatelessWidget {
  const Note_Bottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AddNote_Cubit(),
      child: Container(
        padding: EdgeInsets.all(8),
        child: BlocConsumer<AddNote_Cubit,AddNote_States>(
          listener: (context,state){
            if(state is AddNote_FailureStates )
              {
                print("error ${state.errormassege}");
              }
            if(state is AddNote_SuccesStates)
              {
                Navigator.pop(context);
                BlocProvider.of<Notes_Cubit>(context).fetchnotes();
              }
          },
            builder:(context,state){
            return AbsorbPointer(
              absorbing: state is AddNote_LoadingStates? true: false,
                child: notebottomsheetbody());
            }),
      ),
    );
  }
}


