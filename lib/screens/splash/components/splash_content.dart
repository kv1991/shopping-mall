import 'package:flutter/material.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/size_config.dart';


class SplashContent extends StatelessWidget {
  final String text, image;
  const SplashContent({
    Key key,
    @required this.image,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
         'TOKOTO',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold
          ),
        ),
       Text(text),
       Spacer(flex: 2),
       Image.asset(
         image, 
         width: getProportionateScreenWidth(235), 
         height: getProportionateScreenHeight(265)
        )
      ]
    );
  }
}