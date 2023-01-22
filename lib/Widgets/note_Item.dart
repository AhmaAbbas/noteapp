
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noteapp/cubit/notes/notes_cubit.dart';
import 'package:noteapp/note_model/note_model.dart';
import 'package:hive/hive.dart';
import '../views/edit_noteview.dart';
import 'consts.dart';

class Note_Item extends StatelessWidget {
  const Note_Item({Key? key,required this.note}) : super(key: key);
  final Note_Model note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return Edit_NnoteView(note: note,);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(top: 20,bottom: 40),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(note.title??" ",style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 25,fontWeight: FontWeight.bold),),
              ),
              subtitle: Text(note.subtitle??" ",style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 22,),),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<Notes_Cubit>(context).fetchnotes();
              },
                icon: FaIcon(FontAwesomeIcons.trash,color: Colors.black,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16,top: 16),
              child: Text(note.date??" ",style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 22),),
            ),
          ],
        ),
      ),
    );
  }
}
