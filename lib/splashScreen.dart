import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'cacheHelper.dart';
import 'onBoardingScreen.dart';

class splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _splash();

}
class _splash extends State<splash>{

  void initState (){
    print("started");
    print(CacheHelper.getData(key:"onBoarding"));
    NavigatToNextScreen();
    super.initState();
  }

  void NavigatToNextScreen (){
    Timer(
        const Duration(seconds: 2),
            (){
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => onBoarding(),));
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7265E2),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 41.0),
          child: SvgPicture.asset("assets/svg/logo.svg",
            width: double.infinity,
            height: 43,
          ),
        ),
      ),
    );
  }

}