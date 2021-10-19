import 'package:flutter/material.dart';
import 'package:shopping_mall/size_config.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final GestureTapCallback press;
  const SectionTitle({ this.title, this.press, Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black
          )
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            'See More',
            style: TextStyle(
              color: Color(0xFFBBBBBB)
            )
          ),
        )
      ]
    );
  }
}