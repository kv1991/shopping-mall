import 'package:flutter/material.dart';
import 'package:shopping_mall/components/default_button.dart';
import 'package:shopping_mall/screens/sign_in/sign_in_screen.dart';
import 'package:shopping_mall/screens/splash/components/splash_content.dart';
import 'package:shopping_mall/size_config.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>>splashData = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        // width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() => {
                    currentPage = value
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(image: splashData[index]['image'], text: splashData[index]['text']),
              )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Spacer(),
                    DefaultButton(
                      text: 'Continue',
                      press: () => {
                        Navigator.pushNamed(context, SignInScreen.routeName)
                      }
                    )
                    // Row()
                  ]
                ),
              ),
            ),
          ]
        )
      ),
    );
  }
}

