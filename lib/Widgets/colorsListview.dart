import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubit/addnotecubit/addnote_cubit.dart';

class Colors_ListView extends StatefulWidget {
   Colors_ListView({Key? key}) : super(key: key);

  @override
  State<Colors_ListView> createState() => _Colors_ListViewState();
}

class _Colors_ListViewState extends State<Colors_ListView> {
  int currentindex=0;
  List<Color> colors=[
    Color(0xff2B193D),
    Color(0xff2C365E),
    Color(0xff484D6D),
    Color(0xff4B8F8C),
    Color(0xffC5979D),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32*2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
            onTap: (){
              currentindex=index;
              BlocProvider.of<AddNote_Cubit>(context).color=colors[index];
              setState(() {});
            },
            child: ColorItem(
              active: currentindex==index?true:false,
              color: colors[index],
              ),
          ),
        );
      }),
    );
  }
}
class  ColorItem extends StatelessWidget {
  ColorItem({Key? key,required this.active,required this.color}) : super(key: key);
  bool active;
  Color color;
  @override
  Widget build(BuildContext context) {
    return active ?  CircleAvatar(
      backgroundColor: Colors.white,
      radius: 32,
      child: CircleAvatar(
        radius: 28,
        backgroundColor: color,
      ),
    )
        : CircleAvatar(
      radius: 32,
      backgroundColor: color,
    );
  }
}

