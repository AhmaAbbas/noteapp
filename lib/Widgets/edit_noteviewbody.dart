import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubit/notes/notes_cubit.dart';
import 'package:noteapp/note_model/note_model.dart';

import 'Customappbar.dart';
import 'custom_textformfeild.dart';
import 'editnoteviewcolorlist.dart';

class Edit_NoteViewbody extends StatefulWidget {
  Edit_NoteViewbody({Key? key,required this.note}) : super(key: key);
   Note_Model note;

  @override
  State<Edit_NoteViewbody> createState() => _Edit_NoteViewbodyState();
}

class _Edit_NoteViewbodyState extends State<Edit_NoteViewbody> {
   String? title;
   String? content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Custom_APPBar(
              icon: Icons.check,
              title: "Edit Note",
              onpressed: (){
                widget.note.title=title??widget.note.title;
                widget.note.subtitle =content??widget.note.subtitle;
                widget.note.save();
                BlocProvider.of<Notes_Cubit>(context).fetchnotes();
                Navigator.pop(context);
              }),
          Custom_Textformfeild(
              label_text: widget.note.title,
            onchaged: (value){
                title=value;
            },
          ),
          SizedBox(height: 10,),
          Custom_Textformfeild(
            label_text: widget.note.subtitle,
            onchaged: (value){
              content=value;
            },
            maxlines: 5,),
          EditNoteColorListView(note:widget.note,),
        ],
      ),
    );
  }
}
