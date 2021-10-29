import 'package:flutter/material.dart';
import 'package:shopping_mall/models/Product.dart';
import 'package:shopping_mall/screens/details/components/product_descriptions.dart';
import 'package:shopping_mall/screens/details/components/product_images.dart';
import 'package:shopping_mall/screens/details/components/top_rounded_container.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({ Key key, this.product }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescriptions(product: product)
            ]
          )
        )
      ]
    );
  }
}

