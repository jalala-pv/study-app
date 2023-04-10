import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';
class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(context),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star,size: 65,color: Colors.amber,),
            Gap(20),
            const Text('This is a study app.', ),
            Gap(20),
          AppCircleButton(child:const Icon(Icons.arrow_forward,size:35,) 
          ,onTap: ()=>null,)
          ],
        ),
      ),
    );
  }
}