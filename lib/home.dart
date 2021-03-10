import 'package:data/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA5D4DC),
      appBar: AppBar(
        title: Text('appbar'),
        backgroundColor: Color(0xff415A80),
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
