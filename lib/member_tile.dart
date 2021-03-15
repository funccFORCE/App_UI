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
        margin: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0.0),
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(5.0, 6.0, 5.0, 6.0),
          leading: CircleAvatar(
            radius: 50.0,
            backgroundColor: Color(0xff415A80),//[member.name]
          ),
          title: Text(member.name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
          )),
          subtitle: Text('Works in ${member.department} Department',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
              ),
          ),
        ),
      ),
    );
  }
}
