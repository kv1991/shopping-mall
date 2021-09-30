import 'package:flutter/material.dart';
import 'package:shopping_mall/components/custom_surfix_icon.dart';
import 'package:shopping_mall/components/default_button.dart';
import 'package:shopping_mall/components/form_errors.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/helper/keyboard.dart';
import 'package:shopping_mall/size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool remember = false;
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  final List <String>errors = [];

  void addError({ String error }) {
    if(!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({ String error }) {
    if(errors.contains(error)) {
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: SizedBox(
                  width: getProportionateScreenWidth(20),
                  child: Checkbox(
                    value: remember,
                    activeColor: kPrimaryColor,
                    onChanged: (value) => {
                      setState(() {
                        remember = value;
                      })
                    }
                  ),
                ),
              ),
              Text('Remember me'),
              Spacer(),
              GestureDetector(
                child: Text('Forgot Password', style: TextStyle(decoration: TextDecoration.underline)),
                onTap: () => Navigator.pushNamed(context, '/forgot_password'),
              )
            ]
          ),
          FormErrors(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                KeyboardUtil.hideKeyboard(context);
                // Navigator.pushNamed(context, '/login_success');
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
        return null;
      },
      validator: (value) {
        if(value.isEmpty) {
          addError(error: kEmailNullError);
          return null;
        } else if(!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return null;
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
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => newValue = password,
      onChanged: (value) {
        if(value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if(value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if(value.isEmpty) {
          addError(error: kPassNullError);
          return null;
        } else if(value.length < 8) {
          addError(error: kShortPassError);
          return null;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Lock.svg')
      )
    );
  }
}