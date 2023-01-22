import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubit/notes/notes_cubit.dart';
import 'package:noteapp/cubit/notes/notes_states.dart';

import '../note_model/note_model.dart';
import 'note_Item.dart';

class ListView_Notes extends StatelessWidget {
  const ListView_Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Notes_Cubit, Note_States>(
      builder: (context, state) {
        List<Note_Model> notes=BlocProvider.of<Notes_Cubit>(context).notes??[];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => Note_Item(note: notes[index]),
            separatorBuilder: (context, index) => SizedBox(height: 10,),
            itemCount: notes.length,),
        );
      },
    );
  }
}