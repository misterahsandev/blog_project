import 'package:flutter/material.dart';

class Roundbutton extends StatelessWidget {
  const Roundbutton({super.key, this.title});
final String ? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
            color: Colors.orange,
      ),
      child: Center(
        child: Text('$title',
        style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w600),),
      ),
    );
  }
}
