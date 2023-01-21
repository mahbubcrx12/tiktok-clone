import 'package:flutter/material.dart';
import 'package:tiktolk_clone/constants.dart';
import 'package:tiktolk_clone/view/widgets/text_input_field.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "Tiktok Clone",
              style: TextStyle(
                  fontSize: 35,
                  color: buttonColor,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              "Login",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 15,),
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
              onTap: (){},
              child: Container(
                width: MediaQuery.of(context).size.width-40,
                height: 50,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                child: Text("Login",style: TextStyle(
                  fontSize: 25
                ),),
                ),
              ),
            ),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Don't have an account?"),
                TextButton(onPressed: (){},
                    child:Text("Register")
                )
              ],),

          ],
        ),
      )),
    );
  }
}
