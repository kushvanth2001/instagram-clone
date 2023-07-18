import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import 'package:instaclone/screens/signinscreen.dart';
import 'package:instaclone/utils/colors.dart';
import 'package:instaclone/widgets/snakbar.dart';
import 'package:instaclone/widgets/textsfeild.dart';
import 'package:instaclone/resources/firebaseauthemail_methods.dart';

import '../responsive/MobileScreenLayout.dart';
import '../responsive/WebScreenLayout.dart';
import '../responsive/responsive_layout.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final  _emailcontroller=TextEditingController();
    TextEditingController _passwordcontroller=TextEditingController();
   bool isloading=false;

@override
  void initState() {
TextEditingController  _emailcontroller=TextEditingController();
TextEditingController _passwordcontroller=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

login(_emailcontroller,_passwordcontroller)async{

setState(() {
  isloading=true;
});
 String res=await  FirebaseAuthemailmethods().loginuser(_emailcontroller.text,_passwordcontroller.text);
if(res=='succes'){
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



    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Container(),flex: 1,),
              
             new  SvgPicture.asset("assets/svg/instagram.svg",color: primaryColor,),
             const  SizedBox(height: 20),
              Textfeild(textcontroller: _emailcontroller,ispass: false, textinputtype:TextInputType.text, hinttext: 'Enter email'),
             const SizedBox(height: 10),
           Textfeild(textcontroller: _passwordcontroller,ispass: true, textinputtype:TextInputType.text, hinttext: 'Password'),
              SizedBox(height: 20),
              Center(
                child: Container(
               padding: const EdgeInsets.all(14),
                  color: Colors.blue,
                  child: InkWell(child: Center(child: isloading==true?Center(child: CircularProgressIndicator(color: Colors.white,),): Text('Login'))
                  ,
                  onTap: () {
                    login(_emailcontroller, _passwordcontroller);
                  },),
                width: double.infinity,),
              ),
          const    SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Add your forgot password logic here
                },
                child:const Text(
                  'Forgot Password?',
                  style:const TextStyle(color: Colors.blue),
                ),
              ),
             const SizedBox(height: 20),
            Flexible(child:Container(),flex: 1,),
        
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Container(child: Text('Dont have an account?'),),GestureDetector(child: Container(child: Text('Signup'),),
                onTap: () {
   Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );
                },
                )],),
             
            ],
          ),
        ),
      ),
    );
  }
}