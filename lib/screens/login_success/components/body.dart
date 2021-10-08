import 'package:flutter/material.dart';
import 'package:shopping_mall/components/default_button.dart';
import 'package:shopping_mall/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset('assets/images/success.png', height: SizeConfig.screenHeight * 0.4),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          'Login Success',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(30)
          )
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: 'Back to home',
            press: () {
              Navigator.pushNamed(context, 'home_screen');
            }),
        ),
        Spacer()
      ]
    );
  }
}