import 'package:data/member.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemberTile extends StatelessWidget {

  final Member member;
  MemberTile({this.member});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 40.0,
            backgroundColor: Color(0xff415A80),//[member.name]
          ),
          title: Text(member.name),
          subtitle: Text('Works in ${member.department} '),
        ),
      ),
    );
  }
}
