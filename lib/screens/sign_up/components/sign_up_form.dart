import 'package:flutter/material.dart';
import 'package:shopping_mall/components/custom_surfix_icon.dart';
import 'package:shopping_mall/components/default_button.dart';
import 'package:shopping_mall/components/form_errors.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/screens/sign_in/sign_in_screen.dart';
import 'package:shopping_mall/size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String conformPassword;
  List<String> formErrors = [];

  void addError({ String error }) {
    if(!formErrors.contains(error)) {
      setState(() {
        formErrors.add(error);
      });
    }
  }

  void removeError({ String error }) {
    if(formErrors.contains(error)) {
      setState(() {
        formErrors.remove(error);
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(40)),
          renderEmailTextField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          renderPasswordTextField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          renderConfPasswordTextField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormErrors(errors: formErrors),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.pushNamed(context, SignInScreen.routeName);
              }
            }
          )
        ],
      )
    );
  }

  Widget renderEmailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email address',
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Mail.svg')
      ),
      onSaved: (val) => val = email,
      onChanged: (val) {
        if(val.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if(emailValidatorRegExp.hasMatch(val)) {
          removeError(error: kInvalidEmailError);
        }
        setState(() {
          val = email;
        });
      },
      validator: (val) {
        if(val.isEmpty) {
          addError(error: kEmailNullError);
          return '';
        } else if(emailValidatorRegExp.hasMatch(val)) {
          addError(error: kInvalidEmailError);
          return '';
        }
        return null;
      },
    );
  }

  Widget renderPasswordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Lock.svg')
      ),
      onSaved: (val) => val = password,
      onChanged: (val) {
        if(val.isNotEmpty) {
          removeError(error: kPassNullError);
          return '';
        } else if(val.length >= 8) {
          removeError(error: kShortPassError);
          return '';
        }
        setState(() {
          val = password;
        });
      },
      validator: (val) {
        if(val.isEmpty) {
          addError(error: kPassNullError);
          return '';
        } else if(val.length < 8) {
          addError(error: kShortPassError);
          return '';
        }
        return null;
      },
    );
  }

  Widget renderConfPasswordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'ConFirm Password',
        hintText: 'Enter your confirm password',
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Lock.svg')
      ),
      onSaved: (val) => val = conformPassword,
      onChanged: (val) {
        if(val.isNotEmpty) {
          removeError(error: kPassNullError);
          return '';
        } else if(val.length >= 8) {
          removeError(error: kShortPassError);
          return '';
        } else if (val == password) {
          removeError(error: kMatchPassError);
        }
        setState(() {
          val = password;
        });
      },
      validator: (val) {
        if(val.isEmpty) {
          addError(error: kPassNullError);
          return '';
        } else if(val.length < 8) {
          addError(error: kShortPassError);
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