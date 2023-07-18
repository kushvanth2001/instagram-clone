import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instaclone/models/user.dart';
import 'package:instaclone/resources/firebaseauthemail_methods.dart';

class UserProvider extends GetxController{
 
  final FirebaseAuthemailmethods _authMethods = FirebaseAuthemailmethods();
  var _instauser = InstaUser(username: 'defalutname', uid: 'defaultuid', photoUrl: 'defaulturl', email: 'defaultemail', bio: 'bio', followers: [], following: []).obs;
  get getuser =>_instauser.value;

  Future<void> refreshUser() async {
    InstaUser user = await _authMethods.getUserDetails();
    _instauser (user);
    
  }

}