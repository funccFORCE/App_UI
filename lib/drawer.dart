import 'package:data/auth.dart';
import 'package:data/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget {

  final AuthService _auth = AuthService();
  final Function onTap;

  MyDrawer({
    this.onTap
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff415A80),
              ),
              child: Padding(
                padding: EdgeInsets.all(7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundColor: Color(0xff415A80),
                        backgroundImage: AssetImage('images/transparent_logo.png'),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'funccFORCE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'www.funccforce.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Terms & Conditions'),

              onTap: () {

              },
            ),
            ListTile(
              title: Text('Privacy Policy'),
              onTap: () {

              },
            ),
            Divider(height: 2, color: Color(0xff415A80),),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.linkedin),
              title: Text('LinkedIn'),
              onTap: () {

              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.twitter),
              title: Text('Twitter'),
              onTap: () {

              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.instagram),
              title: Text('Instagram'),
              onTap: () {

              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.facebook),
              title: Text('Facebook'),
              onTap: () {

              },
            ),
            Divider(height: 2, color: Color(0xff415A80),),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () async{
                    await _auth.signOut();
                  },
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
