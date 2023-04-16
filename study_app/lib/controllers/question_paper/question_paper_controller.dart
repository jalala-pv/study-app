import 'package:get/get.dart';
import 'package:study_app/services/firebase_storage_service.dart';
import 'package:flutter/material.dart';

/*it provides names of images to firebaseStorageservice.dart
and stores the returned url of all images*/

class QuestionPaperController extends GetxController {
  //store url
  final allPaperImages = <String>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ['biology', 'chemistry', 'maths', 'physics'];
    try {
      for (var img in imgName) {
        //giving imgnames to getimage and it returns their url in firebase
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);

        //add url to allpaperimages
        allPaperImages.add(imgUrl?? 'null' );
      }
    } catch (e) {
      //error
      print(e);
    }
  }
}
