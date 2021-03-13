import 'package:data/auth.dart';
import 'package:data/database.dart';
import 'package:data/drawer.dart';
import 'package:data/member.dart';
import 'package:data/member_list.dart';
import 'package:data/user_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: UserSettings(),
        );
      });
    }

    return StreamProvider<List<Member>>.value(
        value: DatabaseService().members,
        child: Scaffold(
        backgroundColor: Color(0xffA5D4DC),
          appBar: AppBar(
            //title: Text('Welcome'),
            backgroundColor: Color(0xff415A80),
            actions: <Widget>[

              TextButton.icon(
                icon: Icon(Icons.add, color: Color(0xffA5D4DC)),
                label: Text(''),
                onPressed: ()=> _showSettingsPanel(),
              ),
            ],
          ),
            drawer: MyDrawer(
            onTap: () {

          },),
             body: MemberList(),
        )
    );
  }
}
