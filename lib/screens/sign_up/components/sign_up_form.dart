import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_mall/components/custom_surfix_icon.dart';
import 'package:shopping_mall/components/default_button.dart';
import 'package:shopping_mall/components/form_errors.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/helper/keyboard.dart';
import 'package:shopping_mall/screens/complete_profile/complete_profile_screen.dart';
import 'package:shopping_mall/size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool remember = false;
  bool isObscureText = true;
  String email;
  String password;
  String confirmPassword;
  String iconPath = 'Lock';
  final _formKey = GlobalKey<FormState>();
  final List <String>errors = [];
  TextEditingController passwordEditingController = TextEditingController();

  void addError({ String error }) {
    if(!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({ String error }) {
    print(error);
    print(errors.contains(error));
    if(errors.contains(error)) {
      setState(() {
        print(error);
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormErrors(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            }
          )
        ]
      )
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => newValue = email,
      onChanged: (value) {
        if(value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if(emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if(value.isEmpty) {
          addError(error: kEmailNullError);
          return '';
        } else if(!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Eamil',
        hintText: 'Enter your email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Mail.svg')
      )
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: isObscureText,
      onSaved: (newValue) => newValue = password,
      controller: passwordEditingController,
      onChanged: (value) {
        if(value.isEmpty) {
          setState(() {
            iconPath = 'Lock';
          });
        }
        if(value.isNotEmpty) {
          removeError(error: kPassNullError);
          setState(() {
            iconPath = 'eye-closed';
          });
        } else if(value.length >= 8) {
          removeError(error: kShortPassError);
        }
        setState(() {
          password = value;
        });
      },
      validator: (value) {
        if(value.isEmpty) {
          addError(error: kPassNullError);
          return '';
        } else if(value.length < 8) {
          addError(error: kShortPassError);
          return '';
        } else if(value.length < 8) {
          addError(error: kShortPassError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
          child: IconButton(
          // icon: CustomSurffixIcon(svgIcon: 'assets/icons/Lock.svg'),
          icon: SvgPicture.asset(
            'assets/icons/${iconPath}.svg',
            width: getProportionateScreenWidth(20)
          ),
          onPressed: () {
            setState(() {
              if(passwordEditingController.text.isNotEmpty) {
                if(isObscureText) {
                  iconPath = 'eye-open';
                } else {
                  iconPath = 'eye-closed';
                }
                isObscureText = !isObscureText;
              } else {
                iconPath = 'Lock';
                isObscureText = true;
              }
            });
          },
        )
        )
      )
    );
  }

  Widget buildConfPasswordFormField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'ConFirm Password',
        hintText: 'Enter your confirm password',
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Lock.svg')
      ),
      onSaved: (val) => val = confirmPassword,
      onChanged: (val) {
        if(val.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (val.isNotEmpty && val == password) {
          removeError(error: kMatchPassError);
        }
      },
      validator: (val) {
        if(val.isEmpty) {
          addError(error: kPassNullError);
          return '';
        } else if (val != password) {
          addError(error: kMatchPassError);
          return '';
        }
        return null;
      },
    );
  }
}