import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/i.jpg'),
            ),
            title: Text('John Doe'),
            subtitle: Text('Liked your photo'),
            trailing: IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                // Perform action when more options button is pressed.
              },
            ),
            onTap: () {
              // Handle notification tap event.
            },
          );
        },
      ),
    );
  }
}