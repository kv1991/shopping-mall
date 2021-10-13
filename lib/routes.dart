import 'package:flutter/material.dart';
import 'package:shopping_mall/screens/OTP/otp_screen.dart';
import 'package:shopping_mall/screens/complete_profile/complete_profile_screen.dart';
import 'package:shopping_mall/screens/forgot_password/forgot_password_screen.dart';
import 'package:shopping_mall/screens/login_success/login_success_screen.dart';
import 'package:shopping_mall/screens/sign_in/sign_in_screen.dart';
import 'package:shopping_mall/screens/sign_up/sign_up_screen.dart';

import 'package:shopping_mall/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OPTScreen.routeName: (context) => OPTScreen(),
};
