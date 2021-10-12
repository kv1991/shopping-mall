import 'package:flutter/material.dart';
import 'package:shopping_mall/screens/complete_profile/components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = '/complete_profile';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete Profile')
      ),
      body: Body()
    );
  }
}