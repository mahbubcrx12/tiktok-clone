import 'package:flutter/material.dart';
import 'package:tiktolk_clone/constants.dart';

import '../widgets/text_input_field.dart';

class Registrar extends StatelessWidget {
   Registrar({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
   final TextEditingController _userNameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tiktok",
                  style: TextStyle(
                      fontSize: 45,
                      color: buttonColor,
                      fontWeight: FontWeight.w900),
                ),
                // SizedBox(height:15 ,),
                // Text(
                //   "Register",
                //   style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.w500),
                // ),
                SizedBox(height: 10,),
                Stack(children: [
                  CircleAvatar(
                    radius: 62,
                    backgroundColor: backgroundColor,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzFLQXUPXBkvRFJvv6H9AioeIedXgS3MWR9A&usqp=CAU"),
                    ),
                  ),
                  Positioned(
                      right: 10,
                      bottom: 5,
                      child: InkWell(
                          onTap: ()=> authController.pickImage(),
                          child: Icon(Icons.add_a_photo,color: Colors.white,size: 35,))
                  )
                ],),
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                      controller:_userNameController ,
                      icon: Icons.person,
                      labelText: "User Name"
                  ),),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                      controller:_emailController ,
                      icon: Icons.email,
                      labelText: "Email"
                  ),),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                    controller:_passwordController ,
                    icon: Icons.lock,
                    labelText: "Password",
                    isObscure: true,
                  ),),
                SizedBox(height: 20,),
                InkWell(
                  onTap: ()=> authController.registerUser(
                      _userNameController.text, _emailController.text, _passwordController.text, authController.profilePhoto),
                  child: Container(
                    width: MediaQuery.of(context).size.width-40,
                    height: 50,
                    decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: Text("Sign Up",style: TextStyle(
                          fontSize: 25
                      ),),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(onPressed: (){},
                        child:Text("Login")
                    )
                  ],),

              ],
            ),
          )),
    );
  }
}
