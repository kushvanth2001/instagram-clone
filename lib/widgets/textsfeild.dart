import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Textfeild extends StatelessWidget {
  final TextEditingController textcontroller;
  final bool ispass;
  final TextInputType textinputtype;
  final String hinttext;

 Textfeild({super.key,required this.textcontroller, required this.ispass, required this.textinputtype,required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return TextField(
              
              controller:textcontroller,
                decoration: InputDecoration(
                     enabledBorder:OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
                  border: OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
                  focusedBorder: OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
                  
              
                  filled: true,
                hintText:hinttext ,
                ),
                obscureText:ispass,
    );
  }
}