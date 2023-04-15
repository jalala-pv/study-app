import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
//this instance is global and used throughout the app
final fireStore=FirebaseFirestore.instance;
/*when we invoke the variable questionPaperRF it will go the firestore and 
create the collection questionpaper*/
final questionPaperRF=fireStore.collection('questionPapers');
/*for each list inside the map we have to create separate subcollection
to create questions subcollection with documents name questionid inside the main collection
 questionpapers*/
DocumentReference questionRF({
  required String paperId,
  required String questionId,
})=>questionPaperRF.doc(paperId).collection('questions').doc(questionId);

//to create a reference to firebase storage
Reference get firebaseStorage => FirebaseStorage.instance.ref();
