import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktolk_clone/controller/auth_controller.dart';

//Colors
const backgroundColor=Colors.black;
var buttonColor=Colors.red[400];
const borderColor=Colors.grey;

//firebase
var firebaseAuth=FirebaseAuth.instance;
var firebaseStorage=FirebaseStorage.instance;
var firestore=FirebaseFirestore.instance;

//controller
var authController=AuthController.instance;
