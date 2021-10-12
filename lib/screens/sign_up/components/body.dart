import 'package:flutter/material.dart';
import 'package:shopping_mall/screens/sign_up/components/sign_up_form.dart';
import 'package:shopping_mall/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text('Register Account', style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold)),
              Text('Completed your details or continue with social media', textAlign: TextAlign.center),
              SignUpForm()
            ],
          ),
        ),
      ),
    );
  }
}