import 'package:flutter/material.dart';

import 'consts.dart';

class Custom_Textformfeild extends StatelessWidget {
  Custom_Textformfeild(
      {this.label_text, this.icon, this.onchaged, this.obsecure = false,this.maxlines=1, this.onSaved});

  String? label_text;
  IconData? icon;
  Function(String)? onchaged;
  void Function(String?)? onSaved;
  bool? obsecure;
  int? maxlines;
  //Function(String)? validate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onSaved:onSaved,
        textAlign: TextAlign.left,
        maxLines:maxlines,
        cursorColor:kprimaarycolor ,
        obscureText: obsecure!,
        validator: (value) {
          if (value?.isEmpty??true) {
            return 'this feild is required';
          }else
            {
              return null;
            }
        },
        onChanged: onchaged,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20.0,),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: kprimaarycolor),
            ),
            labelText: label_text,
            labelStyle: const TextStyle(
              color: kprimaarycolor,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }
}
