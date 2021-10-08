import 'package:flutter/material.dart';
import 'package:shopping_mall/screens/forget_password/component/body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static String routeName = '/forget_password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password'
        ),
      ),
      body: Body()
    );
  }
}