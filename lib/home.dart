import 'package:data/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text('appbar'),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[

          ElevatedButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
              onPressed: () async {
              await _auth.signOut();
              },
              )
        ],
      ),
    );
  }
}
