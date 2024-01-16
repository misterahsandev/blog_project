import 'package:blogproject/home_screen/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../intro_screen/view.dart';
import 'state.dart';

class Splash_screenLogic extends GetxController {
  final Splash_screenState state = Splash_screenState();


  void isLogin(){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user!= null){
      {Future.delayed(Duration(seconds: 3)).whenComplete(() => Get.to(Home_screenPage()));}
    }
    else{
      Future.delayed(Duration(seconds: 3)).whenComplete(() => Get.to(Intro_screenPage()));
    }
  }
}