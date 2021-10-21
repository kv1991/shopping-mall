import 'package:flutter/material.dart';
import 'package:shopping_mall/screens/home/components/categories.dart';
import 'package:shopping_mall/screens/home/components/discount_banner.dart';
import 'package:shopping_mall/screens/home/components/home_header.dart';
import 'package:shopping_mall/screens/home/components/popular_products.dart';
import 'package:shopping_mall/screens/home/components/section_title.dart';
import 'package:shopping_mall/screens/home/components/special_offers.dart';
import 'package:shopping_mall/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              HomeHeader(),
              SizedBox(height: getProportionateScreenHeight(20)),
              DiscountBanner(),
              SizedBox(height: getProportionateScreenHeight(20)),
              Categories(),
              SizedBox(height: getProportionateScreenHeight(20)),
              SpecialOffers(),
              SizedBox(height: getProportionateScreenHeight(20)),
              PopularProducts()
            ]
          )
        )
      )
    );
  }
}

