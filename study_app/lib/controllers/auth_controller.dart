import 'package:get/get.dart';

//for user authentication authcontroller
class AuthController extends GetxController {
  @override
  //this function is only called once in app when we restart
  void onReady() {
    //this function is called automatically
    initAuth();
    super.onReady();

  }

  void initAuth() async {
  /*it shows the splash screen and wait for 2 sec only after that 
  introduction screen is called*/
    await Future.delayed(Duration(seconds: 2));
    navigateToIntroduction();
  }

  void navigateToIntroduction() {
    //whatever routes we had early we want to get rid of that routes
    Get.offAllNamed('/introduction'); //route name
  }
}
