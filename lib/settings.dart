import 'package:data/drawer.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA5D4DC),
      appBar: AppBar(
        //title: Text('Welcome'),
        backgroundColor: Color(0xff415A80),
        actions: <Widget>[

          TextButton.icon(
            icon: Icon(Icons.message, color: Color(0xffA5D4DC)),
            label: Text(''),
          ),
        ],
      ),
      drawer: MyDrawer(
      onTap: () {
      },
      ),
      body: Container(
              padding: EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: <Widget>[

               SizedBox(height: 20.0),

                Text(
                  'Our website',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 20.0),

                Text(
                  'www.funccforce.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 40.0),

                Text(
                  'Mail us at',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 20.0),

                Text(
                  'contact@funccforce.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),

            ],
            ),
            ),
            ),

             );
  }
}
