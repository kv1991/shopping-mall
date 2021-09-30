import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_mall/size_config.dart';

class SocialCart extends StatelessWidget {
  final String icon;
  final Function press;
  const SocialCart({ Key key, this.icon, this.press }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: getProportionateScreenWidth(40),
        height: getProportionateScreenHeight(40),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF5F6F9)
        ),
        // padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child: SvgPicture.asset(
          icon,
          // width: getProportionateScreenWidth(40),
          // height: getProportionateScreenHeight(40)
        )
      ),
    );
  }
}