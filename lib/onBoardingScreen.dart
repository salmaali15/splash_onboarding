import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:splash_onboarding/splashScreen.dart';

import 'cacheHelper.dart';

class onBoarding extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _onBoarding();

}
class _onBoarding extends State<onBoarding>{
  List<Map<String,dynamic>> onBoardingList = [
    {
      "title" : "Behavioral Health Service",
      "subtitle" : "Transforming lives by offering hope and opportunities for recovery, wellness, and independence.",
      "image" : "assets/images/Object 1.png",
    },
    {
      "title" : "Mental Health Service ",
      "subtitle" : "If you think that you or someone you know has a mental health problem, there are a number of ways that you can seek advice.",
      "image" : "assets/images/Object 2.png",
    },
    {
      "title" : "Get Started",
      "subtitle" : "Take the first step on your journey to better mental health. Get started today!",
      "image" : "assets/images/Object 3.png",
    },
  ];

  PageController controller = PageController();
  void dispose() async{
    super.dispose();
    await CacheHelper.setData(key: "onBoarding",value : true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7265E2),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children:[
            PageView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Image.asset(onBoardingList[index]["image"],height:325 ,width:double.infinity , fit:  BoxFit.cover,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        onBoardingList[index]["title"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(onBoardingList[index]["subtitle"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return splash();
                      }));
                    },
                    child: Text("Skip",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SmoothPageIndicator(controller: controller,
                    count: onBoardingList.length,
                    effect: ExpandingDotsEffect(
                        dotColor: Colors.white,
                        dotWidth: 12,
                        dotHeight: 12,
                        expansionFactor: 1.9,
                        activeDotColor: Colors.white
                    ),
                    onDotClicked: (index){},
                  ),
                  ElevatedButton(
                    onPressed: (){
                      controller.nextPage(
                        duration: Duration(milliseconds: 2),
                        curve: Curves.easeInOutCirc,
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: const CircleBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}