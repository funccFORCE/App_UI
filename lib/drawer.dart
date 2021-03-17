import 'package:data/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
            ),
            ListTile(
              title: Text('Privacy Policy'),
            ),
            Divider(height: 2, color: Color(0xff415A80),),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.linkedin),
              title: Text('LinkedIn'),
              onTap: () async {
                if (await canLaunch("https://www.linkedin.com/company/funccforce3/")) {
                await launch("https://www.linkedin.com/company/funccforce3/");
                }
                },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.twitter),
              title: Text('Twitter'),
              onTap: () async {
                if (await canLaunch("https://twitter.com/ForceFuncc")) {
                await launch("https://twitter.com/ForceFuncc");
                }
                },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.instagram),
              title: Text('Instagram'),
              onTap: () async {
                if (await canLaunch("https://www.instagram.com/funccforce/?hl=en")) {
                await launch("https://www.instagram.com/funccforce/?hl=en");
                }
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.facebook),
              title: Text('Facebook'),
              onTap: () async {
                if (await canLaunch("https://www.facebook.com/Funccforce-106941474562767")) {
                await launch("https://www.facebook.com/Funccforce-106941474562767");
                }
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
