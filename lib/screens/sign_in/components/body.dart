import 'package:flutter/material.dart';
import 'package:shopping_mall/screens/sign_in/components/sign_form.dart';
import 'package:shopping_mall/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold
                )
              ),
              Text(
                'Sign in with your email and password  \nor continue with social media',
                textAlign: TextAlign.center
              ),
              SignForm()
            ]
          ) 
        )
      ),
    );
  }
}
