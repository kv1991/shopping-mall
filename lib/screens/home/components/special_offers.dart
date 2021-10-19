import 'package:flutter/material.dart';
import 'package:shopping_mall/screens/home/components/section_title.dart';
import 'package:shopping_mall/size_config.dart';

class SpecialOffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: 'Special for you', press: () {}),
        SizedBox(height: getProportionateScreenHeight(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: 'assets/images/Image Banner 2.png',
                category: 'Smartphnne',
                numBrands: 18,
                press: () {}
              ),
              SpecialOfferCard(
                image: 'assets/images/Image Banner 3.png',
                category: 'Fashion',
                numBrands: 24,
                press: () {}
              )
            ]
          ),
        )
      ]
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  final String image;
  final String category;
  final int numBrands;
  final GestureTapCallback press;

  const SpecialOfferCard({
    this.image,
    this.category,
    this.numBrands,
    this.press,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenHeight(100),
          child: GestureDetector(
            onTap: press,
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff343434).withOpacity(0.4),
                        Color(0xff343434).withOpacity(0.15)
                      ]
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20.0),
                    vertical: getProportionateScreenWidth(10.0)
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: '$category\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(18)
                      ),
                      children: [
                        TextSpan(
                          text: '$numBrands Brands',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(14)
                          )
                        )
                      ]
                    )
                  ),
                ),
              ],
            ),
          )
        )
      ),
    );
  }
}