import 'package:enlacebooking/screen_login.dart';
import 'package:enlacebooking/screen_home.dart';
import 'package:enlacebooking/screen_services.dart';
import 'package:enlacebooking/screen_login.dart';

import 'package:flutter/material.dart';

class EBookingWidget extends StatefulWidget {
  const EBookingWidget({super.key});

  @override
  State<EBookingWidget> createState() {
    return _EBookingWidget();
  }

  void switchScreen() {}
  void restartQuestionScreen() {}
}

class _EBookingWidget extends State<EBookingWidget> {
  var activeScreen = 'screen-start';

  void switchScreenToHome() {
    setState(() {
      activeScreen = 'screen-home';
    });
  }

  void switchScreenToServ() {
    setState(() {
      activeScreen = 'screen-services';
    });
  }

  void switchScreenToStart() {
    setState(() {
      activeScreen = 'screen-start';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = const RegistrationForm();

    if (activeScreen == 'screen-start') {
      screenWidget = const RegistrationForm();
    }

    if (activeScreen == 'screen-home') {
      screenWidget = HomeScreen();
    }

    if (activeScreen == 'screen-services') {
      screenWidget = ServScreen(
        onSwitchToHome: switchScreenToHome,
        onSwitchToStart: switchScreenToStart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 129, 177, 248),
                Color.fromARGB(255, 10, 74, 147)
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
