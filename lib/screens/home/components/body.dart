import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/screens/home/components/DiscountBanner.dart';
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
              Row(
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
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              DiscountBanner(),
              SizedBox(height: getProportionateScreenHeight(20)),
              Categories()
            ]
          )
        )
      )
    );
  }
}

class Categories extends StatelessWidget {
  final List <Map<String, String>>categories = [
    {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
    {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
    {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
    {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
    {"icon": "assets/icons/Discover.svg", "text": "More"}
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List.generate(categories.length, (index) => CategoryCart(icon: categories[index]['icon'], text: categories[index]['text']))
      ]
    );
  }
}

class CategoryCart extends StatelessWidget {
  final String icon;
  final String text;
  const CategoryCart({
    Key key,
    @required this.icon,
    @required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: getProportionateScreenWidth(56),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: getProportionateScreenWidth(56),
                height: getProportionateScreenHeight(56),
                child: SvgPicture.asset(icon)
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
              child: Text(text)
            ),
          ],
        ),
      ),
    );
  }
}

