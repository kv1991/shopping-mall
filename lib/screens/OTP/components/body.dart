import 'package:flutter/material.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/screens/OTP/components/opt_form.dart';
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
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              Text("We sent your code to +1 898 860 ***"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("This code will expired in "),
                  TweenAnimationBuilder(
                    tween: Tween(begin: 30.0, end: 0.0),
                    duration: Duration(seconds: 30),
                    builder: (_, int, child) => Text("00:${int.toInt()}", style: TextStyle(color: kPrimaryColor)),
                  )
                ]
              ),
              OPTForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                child: Text(
                  'Resend OTP Code',
                  style: TextStyle(decoration: TextDecoration.underline)
                ),
                onTap: () {}
              )
            ]
          )
        )
      )
    );
  }
}