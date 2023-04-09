
import 'package:get/get.dart';
import 'package:study_app/controllers/auth_controller.dart';
/*we use dependendency bindings from get package to jump from
 one screen to another in few sec*/
class InitialBindings implements Bindings{
  @override
  void dependencies() {
  //to inject authcontroller and permanent is used to store this in memory
  Get.put(AuthController(),permanent: true);
  }

}
