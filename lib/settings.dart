import 'package:data/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Type your message'),
        content: TextField(
          onChanged: (value) { },
          controller: customController,
          decoration: InputDecoration(hintText: "Write something..."),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              primary: Color(0xff415A80),
            ),
              child: Text('OK'),
              onPressed: () {
              Navigator.of(context).pop(customController.text.toString());
              },
          )
        ],
      );
    });
  }

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
              createAlertDialog(context).then((onValue){
                SnackBar mysnackbar = SnackBar(
                    content: Text('Thanks for your message!'));
                Scaffold.of(context).showSnackBar(mysnackbar);
              });
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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

                SizedBox(height: 10.0),

                Text(
                  'www.funccforce.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
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

                SizedBox(height: 10.0),

                Text(
                  'contact@funccforce.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
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
