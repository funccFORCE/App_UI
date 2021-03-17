import 'package:data/auth.dart';
import 'package:data/constant.dart';
import 'package:data/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

//text field
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Color(0xffA5D4DC),
      /*appBar: AppBar(
        backgroundColor: Color(0xff415A80),
        title: Text('Sign in here'),
        actions: <Widget>[

        ],
      ),*/
      body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: <Widget>[

                SizedBox(height: 100.0),

                Container(
                  child: Image.asset(
                    'images/logo.png',
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 60.0),

                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  }
                  ),

                SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val) => val.length < 6 ? 'Password should have atleast 6 characters' : null,
                  obscureText: true,
                    onChanged: (val) {
                      password = val;
                    }
                ),

                SizedBox(height: 20.0),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff415A80),
                    ),
                  child: Text(
                    'SignIn',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signInWithEmailPass(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Unable to sign in (Wrong Credentials!)';
                          loading = false;
                        });
                      }
                    }
                  }
                ),
                SizedBox(height: 40.0),

                Text (
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                SizedBox(height: 12.0),

                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 0.0),

                TextButton(
                  //icon: Icon(Icons.person),
                  child: Text('Register here', style: TextStyle(
                    fontSize: 18.0,
                  ),),
                  style: TextButton.styleFrom(
                    primary: Color(0xff415A80),
                  ),
                  onPressed: () {
                    widget.toggleView();
                  },
                )

              ],
            ),
          ),
        )
      ),
      ),
    );
  }
}
