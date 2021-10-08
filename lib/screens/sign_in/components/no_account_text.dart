
import 'package:flutter/material.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/screens/forgot_password/forgot_password_screen.dart';
import 'package:shopping_mall/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account? ', style: TextStyle(fontSize: getProportionateScreenWidth(16))),
        GestureDetector(
          child: Text('Sign Up', style: TextStyle(color: kPrimaryColor, fontSize: getProportionateScreenWidth(16))),
          onTap: () {
            // Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
          }
        )
      ]
    );
  }
}