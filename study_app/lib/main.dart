import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/data_uploader_screen.dart';
import 'package:study_app/firebase_options.dart';
import 'package:study_app/routes/app_routes.dart';
import 'package:study_app/screens/introduction/introduction.dart';
import 'package:study_app/screens/splash/splash_screen.dart';

//ui part
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //getx provides
    return GetMaterialApp(
      getPages: AppRoutes.routes()
    );
  }
}


/* this part is used to input our data to backend and once it is done it is not needed anymore
Future<void>main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(home: DataUploaderScreen(),));
}
*/
