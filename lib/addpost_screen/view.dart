import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/Roundbutton.dart';
import 'logic.dart';

class Addpost_screenPage extends StatefulWidget {
  Addpost_screenPage({Key? key}) : super(key: key);

  @override
  State<Addpost_screenPage> createState() => _Addpost_screenPageState();
}

class _Addpost_screenPageState extends State<Addpost_screenPage> {
  final logic = Get.put(Addpost_screenLogic());

  final state = Get.find<Addpost_screenLogic>().state;


  bool showSpinner = false;
  final postRef = FirebaseDatabase.instance.ref().child('Post');
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  File? _image;
  FirebaseAuth _auth = FirebaseAuth.instance;

  final picker = ImagePicker();

TextEditingController titlecontroller = TextEditingController();

  TextEditingController descriptioncontroller = TextEditingController();

  Future getImageGallery()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState((){
      if(pickedFile !=null){
        _image = File(pickedFile.path);
      }
      else {
        print('no image selected');
      }
    });
  }

  Future getImageCamera()async{
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState((){
      if(pickedFile !=null){
        _image = File(pickedFile.path);
      }
      else {
        print('no image selected');
      }
    });
  }

  void dialog(context){
    showDialog(context: context, builder: (
    BuildContext context
    ){
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        content: Container(
          height: 120,
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  getImageCamera();
                  Navigator.pop(context);
                  },
                child: ListTile(
                  leading: Icon(Icons.camera_alt_outlined),
                  title: Text('Camera'),
                ),
              ),
              InkWell(
                onTap: (){
                  getImageGallery();
                  Navigator.pop(context);
                },
                child: ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Gallery'),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add your Blog'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: (){dialog(context);},
                  child: Center(
                    child: Container(
                      height: 200,
                      width: 300,
                     child: _image != null? ClipRect(
                      child: Image.file(_image!.absolute),
                    ):
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.grey,
                       ),
                       height: 100,
                       width: 100,
                       child: Icon(Icons.camera_alt_outlined,color: Colors.indigo,),
                     ),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Form(
                    child: TextFormField(
                      controller: titlecontroller,
                  decoration: InputDecoration(
                    label: Text('Title'),
                    border: OutlineInputBorder()
                  ),
                )),
                SizedBox(height: 25,),
                TextFormField(
                  controller: descriptioncontroller,
                  minLines: 1,
                  maxLines: 4,
                  decoration: InputDecoration(
                    label: Text('Description'),
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 35,),
                InkWell(
                    onTap: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try{
                        int date = DateTime.now().millisecondsSinceEpoch;

                        firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('/blogproject$date');
                        UploadTask uploadTask = ref.putFile(_image!.absolute);
                        await Future.value(uploadTask);

                        final User? user = _auth.currentUser;
                        var newUrl = await ref.getDownloadURL();

                        postRef.child('Post List').child(date.toString()).set(
                            {
                              'pId': date.toString(),
                              'pImage': newUrl.toString(),
                              'pTime': date.toString(),
                              'pTitle': titlecontroller.text.toString(),
                              'pdescription': descriptioncontroller.text.toString(),
                              'pEmail': user!.email.toString(),
                              'uid': user!.uid.toString(),
                            }
                            ).then((value) {}).onError((error, stackTrace) {});
                      }
                          catch(e){
                        setState(() {
                          showSpinner = false;
                        });
                          }
                    },
                    child: Roundbutton(title:"Add post",))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
