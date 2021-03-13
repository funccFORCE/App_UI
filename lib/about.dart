import 'package:data/drawer.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
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
            onPressed: () {

            },
          ),
        ],
      ),
      drawer: MyDrawer(
        onTap: () {

        },
      ),
      body: Container(),
    );
  }
}
