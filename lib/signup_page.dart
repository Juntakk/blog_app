import 'package:blog_app/auth_field.dart';
import 'package:blog_app/signup_btn.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(
            8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SignUp",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              AuthField(hintText: "Name"),
              SizedBox(
                height: 15,
              ),
              AuthField(hintText: "Email"),
              SizedBox(
                height: 15,
              ),
              AuthField(hintText: "Password"),
              SizedBox(
                height: 15,
              ),
              SignupBtn(
                buttonText: "Sign Up",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
