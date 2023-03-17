import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'package:study_app/controllers/question_paper/data_uploader.dart';

class DataUploaderScreen extends StatelessWidget {

  DataUploader controller=Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('uploading'),
      ),
    );
  }
}