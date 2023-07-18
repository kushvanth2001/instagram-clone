import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:instaclone/firebase_options.dart';
import 'package:instaclone/providers/userprovider.dart';
import 'package:instaclone/responsive/MobileScreenLayout.dart';
import 'package:instaclone/responsive/WebScreenLayout.dart';
import 'package:instaclone/responsive/responsive_layout.dart';
import 'package:instaclone/screens/homescreen.dart';
import 'package:instaclone/screens/loginscreen.dart';

import 'package:instaclone/utils/colors.dart';
import 'package:instaclone/utils/themes.dart';
import 'package:instaclone/views/bottomnavbarview.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){

  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyD2B3lqw5gbnaSN2Riri--2n1q9kyGftMM", appId: "1:865295307417:web:2984835af8e628d67a9e08", messagingSenderId: "865295307417", projectId: "inataclone-3",storageBucket: "inataclone-3.appspot.com")
  );}
  else{
    

   await Firebase.initializeApp(
 options: DefaultFirebaseOptions.currentPlatform

   );
   

  }
   Get.put(UserProvider());
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.system,
    theme: instatheme().instalighttheme,
    darkTheme: instatheme().instadarktheme,
      title: 'instaclone',
    
     // home:const Responsiblelayout(MobieScreenLayout: MobilScrreenLayout(), WebScreenLayout: WebScreenLayout())
    
 /* home:GetBuilder<UserProvider>(
        init: UserProvider(),
        builder: (controller) => StreamBuilder(
      
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
       if(snapshot.connectionState==ConnectionState.active){
    
    if(snapshot.hasData)


        return Responsiblelayout(MobieScreenLayout: MobilScrreenLayout(), WebScreenLayout: WebScreenLayout());
       }
       else if(snapshot.hasError){
    return Text('something is wrong');
    
       }
       if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
       }
       return LoginScreen();
     },))*/
     home:LoginScreen()
    );
  }
}

