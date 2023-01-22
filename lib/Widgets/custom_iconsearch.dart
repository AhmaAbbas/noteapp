import 'package:flutter/material.dart';

class Custom_Iconsearch extends StatelessWidget {
  const Custom_Iconsearch({Key? key,required this.icon}) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(icon),
    );
  }
}