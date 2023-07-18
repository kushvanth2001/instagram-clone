import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instaclone/resources/firebaseauthemail_methods.dart';
import 'package:instaclone/responsive/MobileScreenLayout.dart';
import 'package:instaclone/screens/homescreen.dart';


import 'package:instaclone/utils/pickimage.dart';
import 'package:instaclone/widgets/snakbar.dart';

import '../responsive/WebScreenLayout.dart';
import '../responsive/responsive_layout.dart';
import '../utils/colors.dart';
import '../widgets/textsfeild.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _biocontroller = TextEditingController();
  Uint8List? pic;
  bool isloading=false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
    _biocontroller.dispose();
    super.dispose();
  }

  void imagepick() async {
     var  im=await PickImage(ImageSource.gallery);
    setState(() {
        
   pic=im;
    });

  }
signup(_emailcontroller,_passwordcontroller,_usernamecontroller,_biocontroller,pic)async{

setState(() {
  isloading=true;
});
 String res=await    FirebaseAuthemailmethods().Signupuser(
                          bio: _biocontroller.text,
                          username: _usernamecontroller.text,
                          file: pic!,
                          email: _emailcontroller.text,
                          password: _passwordcontroller.text,
                        );
if(res=='success'){
  setState(() {
    isloading=false;
  });
  
 Navigator.pushAndRemoveUntil(

              context,
              MaterialPageRoute(builder: (context) => Responsiblelayout(MobieScreenLayout: MobilScrreenLayout(), WebScreenLayout: WebScreenLayout())),
              (route) => false,
            );
}else{
  setState(() {
    isloading=false;
  });
  Snakbar( text: res,);
}


}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  resizeToAvoidBottomInset: false,
  body: SafeArea(
    child: Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(flex: 1,child: Container(),), // Spacer
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svg/instagram.svg", color: primaryColor),
                  SizedBox(height: 20),
                Container(
                  width: 130,
                    child: Stack(
                      children: [
                          Positioned(
                      bottom: -7,
                      left:70,
                          child:IconButton(iconSize:30,icon:Icon( Icons.camera),onPressed: imagepick,),
                           
                          
                        ),
                        pic != null
                            ? CircleAvatar(
                            radius: 50,
                                backgroundImage: MemoryImage(pic!),
                              )
                            : CircleAvatar( radius: 40,child: Icon(Icons.person, size: 90,
                            )),
                      
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Textfeild(
                    textcontroller: _usernamecontroller,
                    ispass: false,
                    textinputtype: TextInputType.text,
                    hinttext: 'Enter your Username',
                  ),
                  SizedBox(height: 20),
                  Textfeild(
                    textcontroller: _emailcontroller,
                    ispass: false,
                    textinputtype: TextInputType.text,
                    hinttext: 'Enter your Email',
                  ),
                  SizedBox(height: 10),
                  Textfeild(
                    textcontroller: _passwordcontroller,
                    ispass: true,
                    textinputtype: TextInputType.text,
                    hinttext: 'Password',
                  ),
                  SizedBox(height: 20),
                  Textfeild(
                    textcontroller: _biocontroller,
                    ispass: false,
                    textinputtype: TextInputType.text,
                    hinttext: 'Enter bio',
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        color: Colors.blue,
                        child: Center(child: isloading==true?Center(child: CircularProgressIndicator(),): Text('signup')),
                        width: double.infinity,
                      ),
                      onTap: () {
                      signup(_emailcontroller, _passwordcontroller, _usernamecontroller, _biocontroller, pic);
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // Add your forgot password logic here
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                     Flexible(flex: 1, child: Container(),), // 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      Text('login'),
                    ],
                  ),
                ],
              ),
            ),
         
          ],
        ),
      ),
    ),
  ),);
  }}