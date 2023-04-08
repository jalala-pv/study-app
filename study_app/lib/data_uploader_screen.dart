import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'package:study_app/controllers/question_paper/data_uploader.dart';
import 'package:study_app/firebase_ref/loading_status.dart';

class DataUploaderScreen extends StatelessWidget {

  DataUploader controller=Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /* to update the ui if the data has stored to firestore
       when the observable value (loadingstatus) changes,the widget inside obx() widget rebuild
       itself
        */
        child: Obx(() => Text(controller.loadingStatus.value==LoadingStatus.completed?
        'uploading completed':'uploading.....')),
      ),
    );
  }
}