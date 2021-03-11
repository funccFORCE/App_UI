import 'package:data/member.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MemberList extends StatefulWidget {
  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  @override
  Widget build(BuildContext context) {

    final members = Provider.of<List<Member>>(context);
    members.forEach((member) {
      print(member.name);
      print(member.course);
      print(member.mobile);
      print(member.college);
      print(member.department);
    });

    return Container();
  }
}
