import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_mall/components/default_button.dart';
import 'package:shopping_mall/components/socal_card.dart';
import 'package:shopping_mall/constants.dart';
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
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
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialCart(icon: 'assets/icons/google-icon.svg', press: () {}),
                    SocialCart(icon: 'assets/icons/facebook-2.svg', press: () {}),
                    SocialCart(icon: 'assets/icons/twitter.svg', press: () {}),
                  ]
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? '),
                    GestureDetector(
                      child: Text('Sign Up', style: TextStyle(color: kPrimaryColor)),
                      onTap: () {}
                    )
                  ]
                )
              ]
            ),
          ) 
        )
      ),
    );
  }
}
