

import 'dart:core';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:instaclone/models/user.dart';
import 'package:instaclone/resources/storage_methods.dart';

class FirebaseAuthemailmethods{
FirebaseAuth _auth=FirebaseAuth.instance;
FirebaseFirestore _firestore=FirebaseFirestore.instance;


  Future<InstaUser> getUserDetails() async {
    User currentUser = _auth.currentUser!;

   DocumentSnapshot documentsnapshot =await _firestore.collection('users').doc(currentUser.uid).get();
        try {
   DocumentSnapshot documentsnapshot =await _firestore.collection('users').doc(currentUser.uid).get();
  print(' Check if the snapshot exists');
  if (documentsnapshot.exists) {
    // Process the snapshot data
       return InstaUser.fromSnap(documentsnapshot);
    // Perform operations with the data
    // ...
  } else {
    // Handle the case when the snapshot does not exist
    // ...
  }
} catch (e) {
  // Handle any potential errors that occur during the process
  print('Error accessing document snapshot: $e');
  // ...
}

    return InstaUser.fromSnap(documentsnapshot);
  }




Future<String> Signupuser({required String username,required String email,required String password,required String bio,required Uint8List file})  async{
try{
var res="something is wrong";
if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty ){
UserCredential cred=await _auth.createUserWithEmailAndPassword(email: email, password: password);
String photourl =await StorageMethods().uploadImageToStorage('profilepics',file,false);

InstaUser instaUser= InstaUser(bio: bio, email:email,username: username,uid:cred.user!.uid,followers: [],following: [], photoUrl:photourl);
print(instaUser.toJson());
try{
await _firestore.collection('users').doc(cred.user!.uid).set(instaUser.toJson());}
catch(e){
  print(e.toString());
  print("''''''''''''''");
}
res='success';
return res;

}

return res;
}catch(err){
String res=err.toString();
print(res.toString());
return res;
}


}



Future<String>loginuser(String email,String password)async{
String res='something is wrong';
try{
if(email.isNotEmpty || password.isNotEmpty)
 await  _auth.signInWithEmailAndPassword(email: email, password: password);
if(_auth.currentUser!=null){

  res='succes';
  return res;
}
}catch(err){

  print(err.toString());

}
return res;

}



  Future<void> signOut() async {
    await _auth.signOut();
  }
}

