import 'package:flutter/material.dart';

class instatheme{


ThemeData instalighttheme=ThemeData(brightness: Brightness.light,

textTheme:ThemeData().textTheme.apply(bodyColor: Colors.black),
scaffoldBackgroundColor:  Color.fromRGBO(247, 244, 244, 1),
 colorScheme: ColorScheme.light().copyWith(background: Colors.white,),
primaryColor: Colors.white,
appBarTheme: AppBarTheme(backgroundColor: Colors.white,iconTheme: IconThemeData(color: Colors.black)),

);
ThemeData instadarktheme=ThemeData(brightness: Brightness.dark,
textTheme:ThemeData().textTheme.apply(bodyColor: Colors.white),
  colorScheme: ColorScheme.dark().copyWith(
        background: Colors.black, // Set the background color for the entire app
      ),
scaffoldBackgroundColor:   Color.fromRGBO(0, 0, 0, 1),
primaryColor: Colors.black,
appBarTheme: AppBarTheme(backgroundColor: Colors.black,iconTheme: IconThemeData(color: Colors.white)),
);

}