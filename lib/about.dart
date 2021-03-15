import 'package:data/drawer.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA5D4DC),
      appBar: AppBar(
        backgroundColor: Color(0xff415A80),
        actions: <Widget>[

          TextButton.icon(
            icon: Icon(Icons.message, color: Color(0xffA5D4DC)),
            label: Text(''),
            onPressed: () {

            },
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
                      'About funccFORCE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),

                    SizedBox(height: 40.0),

                  Text(
                    'Our team at funccFORCE highlights involute actions towards achieving the goal of women empowerment with the outcomes. We take immense pride in considering our team as a bunch of constructive individuals who are provocative in showing support to the women. We hold similar views in reverting the women with what they are worthy of and generating a significant quota of recognition so as to approach the sublime conditions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),

                ]
            ),
        ),
      ),
    );
  }
}
