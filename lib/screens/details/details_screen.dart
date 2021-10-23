import 'package:flutter/material.dart';
import 'package:shopping_mall/models/Product.dart';
import 'package:shopping_mall/screens/details/components/body.dart';
import 'package:shopping_mall/screens/details/components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = '/details';
  
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments args = ModalRoute.of(context).settings.arguments as ProductDetailsArguments;

    return Scaffold(
      backgroundColor: Color(0xffF5f6f9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: args.product.rating)
      ),
      body: Body()
    );
  }
}


class ProductDetailsArguments {
  final Product product;
  ProductDetailsArguments({ @required this.product });
}