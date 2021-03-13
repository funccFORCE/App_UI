import 'package:data/authenticate.dart';
import 'package:data/home.dart';
import 'package:data/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);

    if (user == null) {
      return Authenticate();
    }
    else {
      return Home();
    }
  }
}
