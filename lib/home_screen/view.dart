import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class Home_screenPage extends StatelessWidget {
  Home_screenPage({Key? key}) : super(key: key);

  final logic = Get.put(Home_screenLogic());
  final state = Get
      .find<Home_screenLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Home_screenLogic>(builder: (home_screenlogic)
      => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Blogs'),
          actions: [
            InkWell(
                onTap: home_screenlogic.navigationMethod,
                child: Icon(Icons.add)),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Icon(Icons.login),
            ),

          ],
        ),
      ),
    );
  }
}
