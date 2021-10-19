import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/size_config.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: SizeConfig.screenWidth * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kSecondaryColor.withOpacity(0.1),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search product',
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            onChanged: (val) {}
          )
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(50),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kSecondaryColor.withOpacity(0.1),
            ),
            height: getProportionateScreenHeight(46),
            width: getProportionateScreenHeight(46),
            child: SvgPicture.asset('assets/icons/Cart Icon.svg')
          ),
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(50),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kSecondaryColor.withOpacity(0.1),
                ),
                height: getProportionateScreenHeight(46),
                width: getProportionateScreenHeight(46),
                child: SvgPicture.asset('assets/icons/Bell.svg')
              ),
              Positioned(
                right: 0,
                top: -3,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFF4848),
                    border: Border.all(width: 1.5, color: Colors.white)
                  ),
                  width: getProportionateScreenHeight(16),
                  height: getProportionateScreenHeight(16),
                  child: Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: getProportionateScreenWidth(10),
                        height: 1
                      ))
                  )
                )
              )
            ]
          )
        )
      ]
    );
  }
}