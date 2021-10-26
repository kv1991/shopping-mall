import 'package:flutter/material.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/models/Product.dart';
import 'package:shopping_mall/size_config.dart';

class ProductImages extends StatefulWidget {
  final Product product;
  ProductImages({ Key key, this.product }) : super(key: key);

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(widget.product.images[selectedImage]),
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.images.length, (index) => buildSmallPreview(index: index))
          ]
        )
      ]
    );
  }

  buildSmallPreview({int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenHeight(8)),
        margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
        width: getProportionateScreenHeight(48),
        height: getProportionateScreenHeight(48),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: selectedImage == index ? kPrimaryColor : Colors.transparent),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}