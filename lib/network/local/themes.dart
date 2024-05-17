import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {

  static Color lightParticlesColor = const Color(0x44948282);

  static Color darkParticlesColor = const Color(0x441C2A3D);


  const AppTheme._();
static Color lightStatusBarColor = Colors.white;
static Color darkStatusBarColor = HexColor('333739');
  static Color lightTextColor = Colors.black;
  static Color darkTextColor = Colors.white;
  static Color lightIconColor = Colors.black;
  static Color darkIconColor = Colors.white;


  static final lightMode = ThemeData(
    primarySwatch: Colors.orange,
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: lightTextColor)

    ),
    appBarTheme:  AppBarTheme(
        color: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: lightStatusBarColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        titleTextStyle: TextStyle(
            color: lightTextColor,
            fontSize: 25,fontWeight: FontWeight.bold),
        actionsIconTheme: IconThemeData(
            color: lightIconColor,size: 30)),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.orangeAccent.shade400,
        type: BottomNavigationBarType.fixed
    ),
  );
  static final darkMode = ThemeData(
    primarySwatch: Colors.orange,
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: darkTextColor)

    ),
    appBarTheme:  AppBarTheme(
        color: darkStatusBarColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: darkStatusBarColor,
          statusBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(
            color: darkTextColor,
            fontSize: 25,
            fontWeight: FontWeight.bold),
        actionsIconTheme: IconThemeData(
            color:darkIconColor,size: 30)),
    scaffoldBackgroundColor: darkStatusBarColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkStatusBarColor,
        selectedItemColor: Colors.orangeAccent.shade400,
        type: BottomNavigationBarType.fixed
    ),
  );


  // static Brightness get currentSystemBrightness =>
  //     SchedulerBinding.instance.window.platformBrightness;

  // static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness:
  //     themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
  //     systemNavigationBarIconBrightness:
  //     themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
  //     systemNavigationBarColor: themeMode == ThemeMode.light
  //         ? lightStatusBarColor
  //         : darkStatusBarColor,
  //     systemNavigationBarDividerColor: Colors.transparent,
  //   ));
  // }
}

extension ThemeExtras on ThemeData {
  Color get particlesColor => brightness == Brightness.light
      ? AppTheme.lightParticlesColor
      : AppTheme.darkParticlesColor;
}