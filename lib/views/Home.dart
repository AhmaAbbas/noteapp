import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noteapp/Widgets/Customappbar.dart';

import '../Widgets/Custom_listview.dart';
import '../Widgets/bottom_sheet.dart';
import '../Widgets/note_Item.dart';
import '../Widgets/notesviewbody.dart';
import '../cubit/notes/notes_cubit.dart';

class Home_Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              showModalBottomSheet(
                //isScrollControlled: true,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                  context: context, builder: (context){
                return Note_Bottomsheet();
              });
            },
            child: const FaIcon(FontAwesomeIcons.plus,color: Colors.black,size: 20,),),
          body:const Notes_viewBody(),
        ),
    );
  }
}


// Center(child: Text("Hello Ahmed",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),