import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class Splash_screenPage extends StatefulWidget {
  Splash_screenPage({Key? key}) : super(key: key);

  @override
  State<Splash_screenPage> createState() => _Splash_screenPageState();
}

class _Splash_screenPageState extends State<Splash_screenPage> {
  final logic = Get.put(Splash_screenLogic());

  final state = Get
      .find<Splash_screenLogic>()
      .state;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<Splash_screenLogic>().isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Splash_screenLogic>(builder: (splash_screeenlogic)
      => Scaffold(
        backgroundColor: Colors.orange,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('Welcome to my Blog app',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
