import 'package:flutter/material.dart';
import 'package:shopping_mall/components/rounded_icon_btn.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/models/Product.dart';
import 'package:shopping_mall/size_config.dart';

class ColorDots extends StatefulWidget {
  final Product product;
  const ColorDots({ Key key, this.product }) : super(key: key);

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(widget.product.colors.length, (index) => buildColorDot(color: widget.product.colors[index], idx: index)),
          Spacer(),
          RoundedIconBtn(icon: Icons.remove, press: () {}),
          SizedBox(width: getProportionateScreenWidth(15)),
          RoundedIconBtn(icon: Icons.add, press: () {}, boxShadow: true),
        ]
      ),
    );
  }

  Widget buildColorDot({ color, idx }) {
    return GestureDetector(
      onTap: () {
        this.setState(() {
         selectedIndex = idx;
        });
      },
      child: Container(
        width: getProportionateScreenWidth(40),
        height: getProportionateScreenWidth(40),
        padding: EdgeInsets.all(getProportionateScreenWidth(5)),
        margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // color: Colors.transparent,
          border: Border.all(color: selectedIndex == idx ? kPrimaryColor : Colors.transparent),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color
          )
        ),
      ),
    );
  }
}