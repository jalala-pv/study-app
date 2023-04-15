import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/bindings/initial_bindings.dart';

import 'package:study_app/controllers/theme_controller.dart';

import 'package:study_app/routes/app_routes.dart';





//ui part
void main() async{
  //it waits for all bindings to be done
  await WidgetsFlutterBinding.ensureInitialized();
  //instance of class intialbindings is initialbindings()
   await Firebase.initializeApp();
  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    //getx provides
    return GetMaterialApp(
      /*maintain a consistent look across an app(theme)
       to retrieve the controller which have already
       been registered*/
      theme: Get.find<ThemeController>().lighttheme,
      debugShowCheckedModeBanner: false,
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
