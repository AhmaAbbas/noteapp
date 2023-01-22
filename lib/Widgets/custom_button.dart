import 'package:flutter/material.dart';
import 'package:noteapp/Widgets/consts.dart';

class Custom_Button extends StatelessWidget {
  Custom_Button({required this.data,this.ontap,this.loading=false});
  String? data;
  VoidCallback? ontap;
  bool loading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ontap ,
        child: Container(
          decoration: BoxDecoration(
              color: kprimaarycolor,
              borderRadius: BorderRadius.circular(20)
          ),
          height: 55,
          width: double.infinity,
          child:loading ?const SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          ) : Center(child: Text("$data",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Color(0xff2B475E)),)),
        ),
      ),
    );
  }
}
