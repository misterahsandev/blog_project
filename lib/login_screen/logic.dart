import 'package:blogproject/register_screen/view.dart';
import 'package:get/get.dart';

import '../home_screen/view.dart';
import 'state.dart';

class Login_screenLogic extends GetxController {
  final Login_screenState state = Login_screenState();
  navigationMethod(){
    Get.to(Register_screenPage());
  }
  navigationMethodhome(){
    Get.to(Home_screenPage());
  }
}
