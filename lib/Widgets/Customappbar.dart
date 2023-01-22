
import 'package:flutter/material.dart';

import 'custom_iconsearch.dart';

class Custom_APPBar extends StatelessWidget {
  const Custom_APPBar({Key? key,required this.title,required this.icon,this.onpressed}) : super(key: key);
  final String title;
  final IconData icon;
  final void Function()?onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(child: Text(title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
        Spacer(flex: 1,),
        IconButton(onPressed:onpressed , icon:Custom_Iconsearch(icon: icon),)
      ],
    );
  }
}

