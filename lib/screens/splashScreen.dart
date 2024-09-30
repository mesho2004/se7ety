import 'package:flutter/material.dart';
import 'package:se7etyy/screens/onBoardingScreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>OnboardingScreen(),));

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/logo.png",),width: 300,height: 300,),
            SizedBox(height: 20,),
          
          
           ],
          
        ),

        

      ),

    );
  }
}
