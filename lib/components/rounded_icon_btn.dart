import 'package:flutter/material.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/size_config.dart';

class RoundedIconBtn extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback press;
  final bool boxShadow;
  const RoundedIconBtn({ Key key, @required this.icon, this.press, this.boxShadow = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(40),
      height: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          if(boxShadow)
            BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 10,
              color: Color(0xFFB0B0B0).withOpacity(0.2)
            )
        ]
      ),
      child: TextButton(
        onPressed: press,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          primary: kPrimaryColor,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
          )
        ),
        child: Icon(icon)
      ),
    );
  }
}