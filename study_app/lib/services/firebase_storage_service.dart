import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../firebase_ref/references.dart';

//to load images from firebasestorage

//As it is a service we need to return string into a controller(question_paper_controller.dart)
class FirebaseStorageService extends GetxService {
  // FirebaseStorage storage = FirebaseStorage.instance;
  /*to retrieve the img in firebase storage by passing the name.
  return type is null or string.*/
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage
          //foldername
          .child('question_paper_images')
          //imgname
          .child('${imgName.toLowerCase()}.png');

      //download the image from firebasestorage
      var imgUrl = await urlRef.getDownloadURL();

      return imgUrl;
    } catch (e) {
      return null;
    }
  }
}
