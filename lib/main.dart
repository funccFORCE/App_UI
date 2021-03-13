import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:data/auth.dart';
import 'package:data/user.dart';
import 'package:data/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
    value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Image.asset('images/transparent_logo.png'),
          splashIconSize: 150,
          nextScreen: Wrapper(),
    backgroundColor: Color(0xff415A80),
    splashTransition: SplashTransition.sizeTransition,
    ),
    ));
  }
}
