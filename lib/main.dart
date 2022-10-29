import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    // theme 을 사용하여 공통적으로 사용할 컴포넌트 정의
    theme: ThemeData(
      fontFamily: 'singleDay',
      textTheme: TextTheme(
        headline1: TextStyle(
            color:
            Colors.white,
            fontFamily: 'parisienne',
            fontSize: 80.0
        ),
        headline2: TextStyle(
            color: Colors.white,
            fontFamily: 'sunflower',
            fontSize: 50.0,
            fontWeight: FontWeight.w700
        ),
        bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 30.0
        ),
        bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 20.0),
      ),
    ),
    home: HomeScreen(),
  ));
}
