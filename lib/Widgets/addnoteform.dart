import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/Widgets/colorsListview.dart';
import 'package:noteapp/cubit/addnotecubit/addnote_States.dart';
import 'package:noteapp/cubit/addnotecubit/addnote_cubit.dart';
import 'package:noteapp/note_model/note_model.dart';

import 'custom_button.dart';
import 'custom_textformfeild.dart';

class notebottomsheetbody extends StatefulWidget {
  notebottomsheetbody({
  super.key,
  });

  @override
  State<notebottomsheetbody> createState() => _notebottomsheetbodyState();
}

class _notebottomsheetbodyState extends State<notebottomsheetbody> {
  GlobalKey<FormState> formkey= GlobalKey();
  AutovalidateMode autovalidateMode =AutovalidateMode.disabled;
  String? title;
  String? subtitle;
  @override

  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(children: [
        Custom_Textformfeild(
          label_text: "Title",
          onSaved: (value){
            title=value;
          },),
        SizedBox(height: 10,),
        Custom_Textformfeild(
          onSaved: (value){
            subtitle=value;
          },
          label_text: "content",maxlines: 5,),
        Spacer(flex: 1,),
       Colors_ListView(),
       BlocBuilder<AddNote_Cubit,AddNote_States>(
           builder: (context,state){
         return Custom_Button(
           loading:state is AddNote_LoadingStates?true:false,
           data:"Add",
           ontap: (){
             if(formkey.currentState!.validate()){
               formkey.currentState!.save();
               var currentdate=DateTime.now();
               var farmatcurentdate=DateFormat.yMd().format(currentdate);
               Note_Model note=Note_Model(
                 title!,
                 subtitle!,
                 farmatcurentdate.toString(),
                 Colors.blueAccent.value,
               );
               BlocProvider.of<AddNote_Cubit>(context).addnote(note);
             }
             else
             {
               autovalidateMode=AutovalidateMode.always;
             }
           },
         );
       })
      ],),
    );
  }
}