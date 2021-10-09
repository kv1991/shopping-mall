import 'package:flutter/material.dart';
import 'package:shopping_mall/components/custom_surfix_icon.dart';
import 'package:shopping_mall/components/default_button.dart';
import 'package:shopping_mall/components/form_errors.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/screens/sign_in/components/no_account_text.dart';
import 'package:shopping_mall/screens/sign_in/sign_in_screen.dart';
import 'package:shopping_mall/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  'Forgot Password', 
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold
                  )
                ),
                Text(
                  'Please enter your email and we will send \nyou a link to return to your account',
                  textAlign: TextAlign.center
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                ForgotPasswordForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                NoAccountText()
              ]
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  String email;
  List<String> formErrors = [];
  final _formKey = GlobalKey<FormState>();

  void addError(error) {
    if(!formErrors.contains(error)) {
      setState(() {
        formErrors.add(error);
      });
    }
  }

  void removeError(error) {
    setState(() {
      formErrors.remove(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Mail.svg'),
              hintText: 'Enter your email',
              labelText: 'Email',
            ),
            onSaved: (val) => val = email,
            validator: (val) {
              if(val.isEmpty) {
                addError(kEmailNullError);
                return '';
              } else if(!emailValidatorRegExp.hasMatch(val)) {
                addError(kInvalidEmailError);
                return '';
              }
              return null;
            },
            onChanged: (val) {
              if(val.isNotEmpty) {
                removeError(kEmailNullError);
              } else if(emailValidatorRegExp.hasMatch(val)) {
                removeError(kInvalidEmailError);
              }
            }
          ),
          FormErrors(errors: formErrors),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          DefaultButton(
            text: 'Continue',
            press: () {
              if(_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.pushNamed(context, SignInScreen.routeName);
              }
            }
          )
        ],
      )
    );
  }

  // Widget renderFormErrors() {
  //   return Column(
  //     children: List.generate(formErrors.length, (index) => renderError(formErrors[index]))
  //   );
  // }

  // Widget renderError(error) {
  //   return Padding(
  //     padding: EdgeInsets.all(getProportionateScreenWidth(10)),
  //     child: Row(
  //       children: [
  //         SvgPicture.asset(
  //           'assets/icons/Error.svg',
  //           width: getProportionateScreenWidth(20),
  //           height: getProportionateScreenHeight(20),
  //         ),
  //         SizedBox(width: getProportionateScreenWidth(10)),
  //         Text(error)
  //       ],
  //     ),
  //   );
  // }

}