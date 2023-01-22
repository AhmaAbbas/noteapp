import 'package:flutter/material.dart';
import 'package:noteapp/note_model/note_model.dart';

import '../Widgets/edit_noteviewbody.dart';

class Edit_NnoteView extends StatelessWidget {
   Edit_NnoteView({Key? key,required this.note}) : super(key: key);
  Note_Model note;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Edit_NoteViewbody(note:note,),
      ),
    );
  }
}
