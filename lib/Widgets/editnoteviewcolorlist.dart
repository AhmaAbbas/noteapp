import 'package:flutter/material.dart';
import 'package:noteapp/note_model/note_model.dart';

import 'colorsListview.dart';
import 'consts.dart';

class EditNoteColorListView extends StatefulWidget {
   EditNoteColorListView({Key? key,required this.note}) : super(key: key);
   Note_Model note;
  @override
  State<EditNoteColorListView> createState() => _EditNoteColorListViewState();
}

class _EditNoteColorListViewState extends State<EditNoteColorListView> {
  late int currentindex;
  @override
  void initState() {
    currentindex=kprimarycolors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32*2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kprimarycolors.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: (){
                  currentindex=index;
                  widget.note.color=kprimarycolors[currentindex].value;
                  setState(() {});
                },
                child: ColorItem(
                  active: currentindex==index?true:false,
                  color: kprimarycolors[index],
                ),
              ),
            );
          }),
    );
  }
}
