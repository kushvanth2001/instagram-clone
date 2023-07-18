import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instaclone/models/user.dart';
import 'package:instaclone/providers/userprovider.dart';
import 'package:instaclone/utils/dimensions.dart';
import 'package:provider/provider.dart';

class Responsiblelayout extends StatefulWidget {
 final Widget MobieScreenLayout;
 final Widget WebScreenLayout;
 
 
  const Responsiblelayout({super.key, required this.MobieScreenLayout, required this.WebScreenLayout});

  @override
  State<Responsiblelayout> createState() => _ResponsiblelayoutState();
  
}


class _ResponsiblelayoutState extends State<Responsiblelayout> {
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
   UserProvider userProvider = Get.find<UserProvider>();
    await userProvider.refreshUser();
  }



  @override
  Widget build(BuildContext context) {
   
 return  LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      if(constraints.maxWidth>webscreenminwidth){
        return widget.WebScreenLayout;
      }
          return widget.MobieScreenLayout;
    },
      
  );
      }
}