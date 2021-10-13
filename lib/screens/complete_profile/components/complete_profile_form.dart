import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_mall/components/custom_surfix_icon.dart';
import 'package:shopping_mall/components/default_button.dart';
import 'package:shopping_mall/components/form_errors.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/screens/OTP/otp_screen.dart';
import 'package:shopping_mall/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String firstName;
  String lastName;
  String phoneNumber;
  String address;
  final List <String>errors = [];

  void addError({ String error }) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({ String error }) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormErrors(errors: errors),
          DefaultButton(
            text: 'Continue',
            press: () {
              if(_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.pushNamed(context, OPTScreen.routeName);
              }
            }
          )
        ]
      )
    );
  }

  Widget buildFirstNameFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'First Name',
        hintText: 'Enter your first name',
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/User.svg')
      ),
      onSaved: (val) => val = firstName,
      onChanged: (val) {
        if(val.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
      },
      validator: (val) {
        if(val.isEmpty) {
          addError(error: kNamelNullError);
          return '';
        }
        return null;
      },
    );
  }

  Widget buildLastNameFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Last Name',
        hintText: 'Enter your last name',
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/User.svg')
      ),
      onSaved: (val) => val = lastName,
      onChanged: (val) {
        if(val.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
      },
      validator: (val) {
        if(val.isEmpty) {
          addError(error: kNamelNullError);
          return '';
        }
        return null;
      },
    );
  }

  Widget buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter your phone number',
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Phone.svg')
      ),
      onSaved: (val) => val = phoneNumber,
      onChanged: (val) {
        if(val.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
      },
      validator: (val) {
        if(val.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return '';
        }
        return null;
      },
    );
  }

  Widget buildAddressFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Address',
        hintText: 'Enter your Address',
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Location point.svg')
      ),
      onSaved: (val) => val = address,
      onChanged: (val) {
        if(val.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
      },
      validator: (val) {
        if(val.isEmpty) {
          addError(error: kAddressNullError);
          return '';
        }
        return null;
      },
    );
  }
}