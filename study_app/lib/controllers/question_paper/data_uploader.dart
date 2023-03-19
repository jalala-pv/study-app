import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_app/models/question_paper_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
  final firestore=FirebaseFirestore.instance; 
   final manifestContent=await DefaultAssetBundle.of(Get.context!).loadString('AssetManifest.json');
   final Map<String,dynamic>manifestMap=json.decode(manifestContent);
   //load json file and print path
   final papersInAssets=manifestMap.keys.where((path) => path.startsWith('assets/DB/paper')&&path.contains('.json')).toList();
   List<QuestionPaperModel>questionPapers=[];
   for(var paper in papersInAssets){
    //content in each db paper
    String stringPaperContent=await rootBundle.loadString(paper);
  questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
   }
   //access items from the model
   //print('Items number ${questionPapers[0].description}');
   var batch=firestore.batch();

  }
}
