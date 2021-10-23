import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_mall/size_config.dart';

class CustomAppBar extends StatelessWidget {
  final double rating;
  const CustomAppBar({
    Key key,
    @required this.rating
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: getProportionateScreenWidth(40),
              height: getProportionateScreenWidth(40),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                  ),
                  // primary: kPrimaryColor,
                  // padding: EdgeInsets.zero
                ),
                child: SvgPicture.asset('assets/icons/Back ICon.svg', height: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14)
              ),
              child: Row(
                children: [
                  Text(
                    '33',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  const SizedBox(height: 5),
                  SvgPicture.asset('assets/icons/Star Icon.svg')
                ]
              )
            )
          ]
        )
      ),
    );
  }
}