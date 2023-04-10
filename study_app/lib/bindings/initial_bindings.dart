
import 'package:get/get.dart';
import 'package:study_app/controllers/auth_controller.dart';
/* to jump from one screen to another in few sec.bindings 
are used for dependency injection*/
class InitialBindings implements Bindings{
  @override
  /*define the objects that particular screen requires,it include
   data model,controllers..*/
  void dependencies() {
  /*to inject authcontroller and permanent is used to store this
   in memory.the dependency can easily accessed from other parts
   as we use get.put*/
  Get.put(AuthController(),permanent: true);
  }

}
