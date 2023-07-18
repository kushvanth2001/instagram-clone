import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Snakbar extends StatelessWidget {
 late final text;
 Snakbar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return 
              SnackBar(
                content: Text(text),
                duration: Duration(seconds: 3),);
  }
}

