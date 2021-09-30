import 'package:flutter/material.dart';
import 'package:shopping_mall/components/custom_surfix_icon.dart';
import 'package:shopping_mall/components/default_button.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/helper/keyboard.dart';
import 'package:shopping_mall/size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool remember = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                onChanged: (value) => {
                  setState(() {
                    remember = value;
                  })
                }
              ),
              Text('Remember me'),
              Spacer(),
              GestureDetector(
                child: Text('Forgot Password', style: TextStyle(decoration: TextDecoration.underline)),
                onTap: () => Navigator.pushNamed(context, '/forgot_password'),
              )
            ]
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, '/login_success');
              }
            }
          )
        ]
      )
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      // obscureText: true,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => {},
      onChanged: (value) => {},
      decoration: InputDecoration(
        labelText: 'Eamil',
        hintText: 'Enter your email',
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Mail.svg')
      )
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => {},
      onChanged: (value) => {},
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Lock.svg')
      )
    );
  }
}