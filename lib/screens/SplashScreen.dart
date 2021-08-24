import 'dart:async';
import 'package:shop/screens/OnBoardingScreen.dart';
import 'package:shop/screens/SignInScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String ?isFirst;
  checkIsFirstTime()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      isFirst = sharedPreferences.getString('firstTime');
    });
  }
  @override
  void initState(){
    super.initState();
    checkIsFirstTime();
    Timer(Duration(seconds: 3),(){
      Navigator.popAndPushNamed(context,isFirst == null? OnBoardingScreen.id:SignInScreen.id);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            image:DecorationImage(
                image: AssetImage('assets/images/kid.jpg'),
                fit: BoxFit.fill
            )
        ),
      ),
    );
  }
}
