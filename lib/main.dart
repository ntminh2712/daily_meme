import 'package:daily_meme/Screens/Home/home_screen.dart';
import 'package:daily_meme/Screens/WelCome/welcome_screen.dart';
import 'package:daily_meme/constants.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'Screens/MainNavi/main_navi.dart';
//
// import 'custom-widget-tabs.widget.dart';
// import 'screens.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar example project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}
