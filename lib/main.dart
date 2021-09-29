import 'package:flutter/material.dart';

import 'package:shopping_mall/routes.dart';
import 'package:shopping_mall/screens/splash/splash_screen.dart';
import 'package:shopping_mall/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      routes: routes,
      initialRoute: SplashScreen.routeName,
    );
  }

  theme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Muli',
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
