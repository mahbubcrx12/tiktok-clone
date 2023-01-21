import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktolk_clone/constants.dart';
import 'package:tiktolk_clone/model/user_model.dart' as model;

class AuthController extends GetxController{
  static AuthController instance=Get.find();

   late Rx<File?> _pickedImage;
  File? get profilePhoto => _pickedImage.value;
  void pickImage()async{
    final pickAnImage=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickAnImage!=null){
      Get.snackbar("On image Upload", "Image uploaded succesfully");
    }
    _pickedImage=Rx<File?>(File(pickAnImage!.path));
  }

//upload image to storage
Future<String> _uploadToStorage(File image)async{
  Reference reference=firebaseStorage.ref().child("profilePicture").child(firebaseAuth.currentUser!.uid);
  UploadTask uploadTask=reference.putFile(image);
  TaskSnapshot taskSnapshot=await uploadTask;
  String downloadUrl=await taskSnapshot.ref.getDownloadURL();
  return downloadUrl;
}


  void registerUser(String userName,String email,String password,File? image)async{
    try{
      if(userName.isNotEmpty &&
         email.isNotEmpty&&
         password.isNotEmpty&&
         image !=null){
        UserCredential credential=
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        _uploadToStorage(image);
        String downloadUrl=await _uploadToStorage(image);
        model.UserModel user= model.UserModel(email: email,name: userName,profilePic: downloadUrl,uID: credential.user!.uid);
        await firestore.collection('users').doc(credential.user!.uid).set(user.toJson());
      }
      else{
        Get.snackbar('error caused by', "Enter all the field");
      }

    }
    catch(e){
      Get.snackbar("Auth causing",e.toString());
    }

  }

}