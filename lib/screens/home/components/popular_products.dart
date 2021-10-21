import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/models/Product.dart';
import 'package:shopping_mall/screens/home/components/section_title.dart';
import 'package:shopping_mall/size_config.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: 'Popular Product', press: () {}),
        SizedBox(height: getProportionateScreenHeight(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(demoProducts.length, (index) => ProductCard(product: demoProducts[index]))
            ]
          )
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    this.product,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
      child: GestureDetector(
        // product detail
        onTap: () {},
        child: Container(
          width: getProportionateScreenWidth(140),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: product.id.toString(),
                    child: Image.asset(product.images[0])
                  )
                )
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor
                    )
                  ),
                  Container(
                    width: getProportionateScreenWidth(28),
                    height: getProportionateScreenHeight(28),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: product.isPopular ? kPrimaryColor.withOpacity(0.1) : kSecondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/Heart Icon_2.svg',
                      color: product.isPopular ? Color(0xFFFF4848) : Color(0xFFDBDEE4)
                    ),
                  )
                ]
              )
            ],
          )
        )
      )
    );
  }
}