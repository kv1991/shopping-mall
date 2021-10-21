import 'package:flutter/material.dart';
import 'package:shopping_mall/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = '/details';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body()
    );
  }
}