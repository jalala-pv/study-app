import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          //calling linear gradient
          gradient: mainGradient(context),
        ),
        alignment: Alignment.center,
        child: Image.asset('assets/images/app_splash_logo.png',width: Get.width*0.8,height:Get.height*0.3,),
      ),
    );
  }
}