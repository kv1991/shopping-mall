import 'package:flutter/material.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/models/Product.dart';
import 'package:shopping_mall/screens/details/components/product_images.dart';
import 'package:shopping_mall/size_config.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({ Key key, this.product }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return ProductImages(product: product);
  }
}