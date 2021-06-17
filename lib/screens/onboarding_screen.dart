import 'package:fitness/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var pages=[
    PageViewModel(
      title: "FitMe ",
      bodyWidget: Container(
          height: 1000,
          child: Image.asset("assets/fit3.jpeg", fit: BoxFit.cover,)),
      decoration: const PageDecoration(

        pageColor: Colors.black,
          titleTextStyle: TextStyle(
  color: Colors.white54,fontSize: 40,
  fontWeight: FontWeight.bold)
      ),
    ),

    PageViewModel(
      title: " "
      ,
      bodyWidget: Container(
          height: 1000,
          child: Image.asset("assets/fit4.jpeg", fit: BoxFit.cover,)),
      decoration: const PageDecoration(
        pageColor: Colors.black,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        },
        globalBackgroundColor: Colors.black,
        next: const Icon(Icons.arrow_right,size: 30,color: Colors.orangeAccent,),
        done: const Text("Done",
            style: TextStyle(
              color: Colors.orangeAccent,
                fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(8.0),
            activeSize: const Size(15.0, 8.0),
            activeColor: Colors.white54,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 10.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)
            )
        ),
      ),
    );
  }
}
