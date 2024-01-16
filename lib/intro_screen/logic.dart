import 'package:blogproject/login_screen/view.dart';
import 'package:blogproject/register_screen/view.dart';
import 'package:get/get.dart';

import 'state.dart';

class Intro_screenLogic extends GetxController {
  final Intro_screenState state = Intro_screenState();
  navigationMethod(){
    Get.to(Register_screenPage());
  }
  navigationMethodlogin(){
    Get.to(Login_screenPage());
  }
}
