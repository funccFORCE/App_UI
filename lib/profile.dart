import 'package:data/database.dart';
import 'package:data/member.dart';
import 'package:data/member_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Member>>.value(
        value: DatabaseService().members,
        child: Scaffold(
        backgroundColor: Color(0xffA5D4DC),

         body: MemberList(),
        )
    );
  }
}
