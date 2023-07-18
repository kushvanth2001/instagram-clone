import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instaclone/models/user.dart';
import 'package:instaclone/screens/feed_screen.dart';

import '../providers/userprovider.dart';
import '../utils/highlight.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   UserProvider userprovider=Get.find<UserProvider>();

  @override
  Widget build(BuildContext context) {
    
   
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              // Handle the press event for the message icon.
            },
          ),
        ],
      ),
      body:
      
       Container(
         child: NestedScrollView(
          
         headerSliverBuilder: (context, _) {
              return [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                       Container(
                    
              width: double.infinity,
              height: 120,
              child: ListView.builder(
                
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Column(
                        children: [
                       CircleAvatar(
                        
                            radius: 35,
                            backgroundColor: Colors.grey,
                            child:Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: 
                                                    Obx(
                              () => 
                               CircleAvatar(
                                 backgroundImage: NetworkImage(userprovider.getuser.photoUrl), 
                                      
                                  radius: 30,
                                ),
                              ),
                                                      ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                            'your story',
                              style: TextStyle(fontSize: 13),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  );
                },
              ),
                    )  ],
                    
                  ),
                ),
              ];
            },
             
           body: FeedScreen(),
         ),
       ),
    );
  }
}