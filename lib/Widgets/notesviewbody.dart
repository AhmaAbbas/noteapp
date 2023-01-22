import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Widgets/Customappbar.dart';
import 'package:noteapp/cubit/notes/notes_cubit.dart';

import 'Custom_listview.dart';


class Notes_viewBody extends StatefulWidget {
  const Notes_viewBody({Key? key}) : super(key: key);

  @override
  State<Notes_viewBody> createState() => _Notes_viewBodyState();
}

class _Notes_viewBodyState extends State<Notes_viewBody> {
  @override
  void initState() {
    BlocProvider.of<Notes_Cubit>(context).fetchnotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: const[
          SizedBox(height: 45,),
          Custom_APPBar(icon: Icons.search,title: "Notes"),
          Expanded(child: ListView_Notes())
        ],
      ),
    );
  }
}
