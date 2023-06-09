import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_app/firebase_ref/loading_status.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/models/question_paper_model.dart';
//to store data to firestore
class DataUploader extends GetxController {
  @override
  //this function is only called once in app when we restart
  void onReady() {
    uploadData();
    super.onReady();
  }
  /*calling the members of enum and assigning to variables
  obs allowsto update ui in response to  changes in state or data 
  */
final loadingStatus=LoadingStatus.loading.obs;
  Future<void> uploadData() async {
    /*As we make the variable observable it has a property called value*/
    loadingStatus.value=LoadingStatus.loading;//it has value 0
    //this instance is local reference to firestore which is used only once
    final firestore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //load json file and print path
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith('assets/DB/paper') && path.contains('.json'))
        .toList();
    List<QuestionPaperModel> questionPapers = [];
    for (var paper in papersInAssets) {
      //content in each db paper
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    //access items from the model
    //print('Items number ${questionPapers[0].description}');
    //multiple data sending at once
    var batch = firestore.batch();
    //loop though each qp
    for (var paper in questionPapers) {
      /* takes data from questionpapermodel and  gives data to reference.dart
    for the collection questionpaper it creates documents which is named as each papers id 
    and then for each document it creates field like title,imageurl..and snd the data from 
    question paper model to it 
    batch.set(document,data)
     */
    //create fields
      batch.set(questionPaperRF.doc(paper.id), {
        'title': paper.title,
        'image_url': paper.imageUrl,
        'description': paper.description,
        'time_seconds': paper.timeSeconds,
        'questions_count': paper.questions == null ? 0 : paper.questions!.length
      });
      /*create another for loop for storing questions into firestore
      these values are stored to question collection in references.dart
      we have to pass documentnames of main collection and document names of subcollections too
      */
      for (var questions in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: questions.id);
        //after creating documents it creates fields for each document
        batch.set(questionPath, {
          'question': questions.question,
          'correct answer': questions.correctAnswer
        });
        /*  provides the document names of collection questions(questionpath) and create
         a subcollection answersand the document names of the collection answers 
        */
        for(var answer in questions.answers){
          batch.set(questionPath.collection('answers').doc(answer.identifier)
          , {
          'identifier':answer.identifier,
          'answer':answer.answer
          });

        }
      }
    }

    //submit everydata to firestore
    await batch.commit();
    //after data being uploaded to firestore  value changes from 0 to 1
    loadingStatus.value=LoadingStatus.completed;//1
  }
}
