import 'package:flutter/material.dart';
import 'package:shopping_mall/screens/forgot_password/component/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = '/forgot_password';
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