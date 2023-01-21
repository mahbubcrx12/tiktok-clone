import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? name;
  String? email;
  String? profilePic;
  String? uID;

  UserModel({
    required this.email,
    required this.name,
    required this.profilePic,
    required this.uID});

  Map<String,dynamic> toJson() =>{
    "name":name,
    "email":email,
    "profilePic":profilePic,
    "uID":uID
  };

  static UserModel fromSnapshot(DocumentSnapshot snap){
    var snapshot=snap.data() as Map<String,dynamic>;
    return UserModel(
      email : snapshot['email'],
      name : snapshot['name'],
      profilePic : snapshot['profilePic'],
      uID : snapshot['uID'],
    );

  }
}