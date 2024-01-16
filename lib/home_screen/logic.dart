import 'package:blogproject/addpost_screen/view.dart';
import 'package:get/get.dart';

import 'state.dart';

class Home_screenLogic extends GetxController {
  final Home_screenState state = Home_screenState();
  navigationMethod(){
    Get.to(Addpost_screenPage());
  }
}
