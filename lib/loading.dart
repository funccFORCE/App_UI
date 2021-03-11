import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffA5D4DC),
      child: Center(
        child: SpinKitRotatingPlain(
          color: Color(0xff415A80),
          size: 50.0,
        ),
      ),
    );
  }
}
