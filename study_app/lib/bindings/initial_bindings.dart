
import 'package:get/get.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:study_app/controllers/theme_controller.dart';
import 'package:study_app/services/firebase_storage_service.dart';


class InitialBindings implements Bindings{
  @override
  /*define the objects that particular screen requires,it include
   data model,controllers..*/
  void dependencies() {
          
    //to register themecontroller
  Get.put(ThemeController());
  /*to register authcontroller and permanent is used to store this
   in memory.the dependency can easily accessed from other parts
   as we use get.put
   to jump from one screen to another in few sec.bindings 
  are used for dependency injection*/
  Get.put(AuthController(),permanent: true);
 
  Get.put(FirebaseStorageService());
  }

}
