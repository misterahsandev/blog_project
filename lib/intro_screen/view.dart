import 'package:blogproject/widgets/Roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class Intro_screenPage extends StatelessWidget {
  Intro_screenPage({Key? key}) : super(key: key);

  final logic = Get.put(Intro_screenLogic());
  final state = Get
      .find<Intro_screenLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Intro_screenLogic>(builder: (Intro_screenlogic)
     => Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset('assets/ANlogo.jpg')),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                      onTap:Intro_screenlogic.navigationMethod,
                      child: Roundbutton(title: 'Register',)),
                ),
                InkWell(
                    onTap: Intro_screenlogic.navigationMethodlogin,
                    child: Roundbutton(title: 'Login')),
              ],
            ),
          ),
        ),
    );
  }
}
