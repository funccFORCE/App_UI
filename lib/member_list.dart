import 'package:data/member.dart';
import 'package:data/member_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MemberList extends StatefulWidget {
  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  @override
  Widget build(BuildContext context) {

    final members = Provider.of<List<Member>>(context) ?? [];

    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (context, index) {
        return MemberTile(member: members[index]);
      },
    );
  }
}
