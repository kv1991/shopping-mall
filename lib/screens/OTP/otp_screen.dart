import 'package:flutter/material.dart';
import 'package:shopping_mall/screens/OTP/components/body.dart';

class OPTScreen extends StatelessWidget {
  static String routeName = '/otp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OPT vertification')
      ),
      body: Body()
    );
  }
}