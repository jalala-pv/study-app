import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/question_paper_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //to find    QuestionPaperController which have already registered
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      //when the obs variable allPaperImages changes, the ui updates itself(first it is empty then url is stored in it)
        body: Obx(
      () => ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              child: SizedBox(
                height: 200,
                width: 200,
                child:
                //if network image doesnt work we can replace another img
                 FadeInImage(
                  image: NetworkImage(
                      _questionPaperController.allPaperImages[index]),
                  placeholder: AssetImage('assets/images/app_splash_logo.png'),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: _questionPaperController.allPaperImages.length),
    ));
  }
}
