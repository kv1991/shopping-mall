import 'package:flutter/material.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/size_config.dart';

class OPTForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.2),
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
          ]
        ),
      ),
    );
  }
}