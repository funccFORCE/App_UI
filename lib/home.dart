import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/auth.dart';
import 'package:data/member.dart';
import 'package:data/member_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:data/database.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Member>>.value(
      value: DatabaseService().members,
        child: Scaffold(
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
          body: MemberList(),
    ));
  }
}
