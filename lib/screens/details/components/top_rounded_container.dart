import 'package:flutter/material.dart';
import 'package:shopping_mall/size_config.dart';

class TopRoundedContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  const TopRoundedContainer({ Key key, this.child, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40)
        )
      ),
      child: child
    );
  }
}