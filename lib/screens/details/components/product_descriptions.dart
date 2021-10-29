import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/size_config.dart';

class ProductDescriptions extends StatelessWidget {
  const ProductDescriptions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
            child: Text(
              'Wireless Controller for PS4™"',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500
              )
            )
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              width: getProportionateScreenWidth(64),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), bottomLeft: Radius.circular(20.0))
              ),
              child: SvgPicture.asset(
                'assets/icons/Heart Icon_2.svg',
                color: Color(0xFFFF4848),
                height: getProportionateScreenWidth(16)
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(64),
            ),
            child: Text(
              "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …",
              maxLines: 3
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
              child: Text(
                'See More Detail >',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor
                )
              )
            ),
          )
        ]
      ),
    );
  }
}