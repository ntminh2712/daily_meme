import 'package:daily_meme/Screens/Article/article_screen.dart';
import 'package:daily_meme/Screens/Home/home_screen.dart';
import 'package:daily_meme/Screens/Profile/ProfileScreen.dart';
import 'package:daily_meme/Screens/WelCome/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../constants.dart';
import '../../constants.dart';
import '../Home/home_screen.dart';


BuildContext testContext;

class MainMenu extends StatefulWidget {
  final BuildContext menuScreenContext;
  MainMenu({Key key, this.menuScreenContext}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  PersistentTabController _controller;
  bool _hideNavBar;
  String title = "Home";

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      HomeList(),
      ArticleScreen(),
      ProfileScreen(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            title = "Settings";
          });
        },
      )
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        textStyle: TextStyle(
          fontSize: 13,
        ),
        icon: Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.indigo,
        inactiveColorPrimary: Colors.black45,
      ),
      PersistentBottomNavBarItem(
        textStyle: TextStyle(
          fontSize: 13,
        ),
        icon: Icon(Icons.add),
        title: ("Article"),
        activeColorPrimary: Colors.indigo,
        inactiveColorPrimary: Colors.black45,
      ),
      PersistentBottomNavBarItem(
        textStyle: TextStyle(
          fontSize: 13,
        ),
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: Colors.indigo,
        inactiveColorPrimary: Colors.black45,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(title == null ? "" : title),
           centerTitle: true,
           automaticallyImplyLeading: false,
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        popActionScreens: PopActionScreensType.once,
        bottomScreenMargin: 0.0,
        selectedTabScreenContext: (context) {
          testContext = context;
   },
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
            colorBehindNavBar: Colors.indigo,
            borderRadius: BorderRadius.circular(0.0)),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:  NavBarStyle.style12, // Choose the nav bar style with this property
      ),
    );
  }
}
