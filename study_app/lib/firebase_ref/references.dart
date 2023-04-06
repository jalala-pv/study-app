import 'package:cloud_firestore/cloud_firestore.dart';
//this instance is global and used throughout the app
final fireStore=FirebaseFirestore.instance;
//when we invoke the variable questionPaperRF it will go the firestore and create the collection questionpaper
final questionPaperRF=fireStore.collection('questionPapers');
