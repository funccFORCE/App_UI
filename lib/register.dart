import 'package:data/auth.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state change
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA5D4DC),
      appBar: AppBar(
        backgroundColor: Color(0xff415A80),
        title: Text('Sign up here'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('SignIn'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    }
                ),
                SizedBox(height: 20.0),
                TextFormField(
                    validator: (val) => val.length < 6 ? 'Password should have atleast 6 characters' : null,
                    obscureText: true,
                    onChanged: (val) {
                      password = val;
                    }
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                     if (_formKey.currentState.validate()) {
                       dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                       if (result == null) {
                         setState(() {
                           error = 'please submit a valid email';
                         });
                       }
                     }
                    }
                ),
                SizedBox(height: 12.0),
                Text (
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          )
      ),
    );
  }
}
