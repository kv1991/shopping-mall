import 'package:flutter/material.dart';
import 'package:shopping_mall/components/default_button.dart';
import 'package:shopping_mall/models/Product.dart';
import 'package:shopping_mall/screens/details/components/color_dots.dart';
import 'package:shopping_mall/screens/details/components/product_descriptions.dart';
import 'package:shopping_mall/screens/details/components/product_images.dart';
import 'package:shopping_mall/screens/details/components/top_rounded_container.dart';
import 'package:shopping_mall/size_config.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({ Key key, this.product }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescriptions(product: product),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.05,
                          right: SizeConfig.screenWidth * 0.05,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15)
                        ),
                        child: DefaultButton(
                          text: 'Add to Cart',
                          press: () {}
                        ),
                      )
                    )
                  ]
                )
              )
            ]
          )
        )
      ]
    );
  }
}



