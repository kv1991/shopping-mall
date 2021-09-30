import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_mall/size_config.dart';

class FormErrors extends StatelessWidget {
  final List errors;
  const FormErrors({ Key key, this.errors }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) => formErrorText(error: errors[index]))
    );
  }

  Padding formErrorText({ @required String error }) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(6)),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/Error.svg',
            width: getProportionateScreenWidth(20),
            height: getProportionateScreenHeight(20),
          ),
          SizedBox(width: getProportionateScreenWidth(10)),
          Text(error)
        ],
      ),
    );
  }
}