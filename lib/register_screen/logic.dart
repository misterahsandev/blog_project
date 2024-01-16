import 'package:blogproject/login_screen/view.dart';
import 'package:get/get.dart';

import 'state.dart';

class Register_screenLogic extends GetxController {
  final Register_screenState state = Register_screenState();
  navigationMethod(){
    Get.to(Login_screenPage());
  }
}
