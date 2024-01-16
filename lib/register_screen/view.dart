import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/Roundbutton.dart';
import 'logic.dart';

class Register_screenPage extends StatefulWidget {
  Register_screenPage({Key? key}) : super(key: key);

  @override
  State<Register_screenPage> createState() => _Register_screenPageState();
}

class _Register_screenPageState extends State<Register_screenPage> {
  final logic = Get.put(Register_screenLogic());

  final state = Get
      .find<Register_screenLogic>()
      .state;

  final _formKey = GlobalKey<FormState>();

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Register_screenLogic>(builder: (Register_screenlogic)
      => Scaffold(

        body: Form(
          key: _formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
             // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text('Register yourself here',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
              ),
              /// email  text feild ///
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),

              ),
              Padding(
                padding:  EdgeInsets.only(left: 20,top: 10),
                child: Row(
                  children: [
                    Text('Already have an account? ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                    InkWell(
                        onTap: Register_screenlogic.navigationMethod,
                        child: Text('Login',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: InkWell(
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                        _auth.createUserWithEmailAndPassword(
                            email: emailcontroller.text.toString(), password: passwordcontroller.text.toString()).
                        then((value) => Register_screenlogic.navigationMethod());
                      }
                    },
                    child: Roundbutton(title: 'Register')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
