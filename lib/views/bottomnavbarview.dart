import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/screens/homescreen.dart';
import 'package:instaclone/screens/notificationscreen.dart';
import 'package:instaclone/screens/profile_screen.dart';


import '../screens/add_post_screen.dart';
import '../screens/search_screen.dart';

class BottomnavbarView extends StatefulWidget {
  @override
  _BottomnavbarViewState createState() => _BottomnavbarViewState();
}

class _BottomnavbarViewState extends State<BottomnavbarView> {
  int _currentIndex = 0;

  final List<Widget> _screens = [

    HomePage(),
    SearchScreen(),
   AddPostScreen(),
    NotificationScreen(),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid)
    
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).brightness==Brightness.light?Colors.black:Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 20,
        selectedIconTheme: IconThemeData(size: 30),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

