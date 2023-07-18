

import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instaclone/models/user.dart';
import 'package:instaclone/providers/userprovider.dart';
import 'package:instaclone/views/bottomnavbarview.dart';
import 'package:provider/provider.dart';

class MobilScrreenLayout extends StatefulWidget {
  const MobilScrreenLayout({super.key});

  @override
  State<MobilScrreenLayout> createState() => _MobilScrreenLayoutState();

}

class _MobilScrreenLayoutState extends State<MobilScrreenLayout> {
 


  UserProvider userProvider = Get.find<UserProvider>();

  @override
  Widget build(BuildContext context) {

  return  BottomnavbarView();
  
}}