import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_learning/controllers/Profile_Controller.dart';
import 'package:flutter_application_learning/core/wedgets/costom_input_text.dart';
import 'package:flutter_application_learning/screens/home/profile/register_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<ProfileController> {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: controller.keyForm1,
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 500,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    "assets/image/login.png",
                    width: 180,
                    height: 180,
                  ),
                  SizedBox(height: 20),
                  CustomInputText(
                    label: 'Email',
                    hintText: 'Enter Your Email',
                    prefixIcon: Icons.email,
                    controller: controller.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    borderRadius: BorderRadius.circular(15),
                  ),
                  SizedBox(height: 20),
                  GetBuilder<ProfileController>(
                    builder: (controller) => CustomInputText(
                      label: 'Password',
                      hintText: 'Enter Your Password',
                      prefixIcon: Icons.lock_sharp,
                      obscureText: controller.obscureText,
                      controller: controller.passwoedController,
                      suffixIcon: IconButton(
                        onPressed: () => controller.showpassword(),
                        icon: Icon(
                          controller.obscureText
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(15),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent),
                      minimumSize: MaterialStateProperty.all(
                        Size(406, 60),
                      ),
                      elevation: MaterialStateProperty.all(5),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (controller.keyForm1.currentState!.validate()) {
                        controller.login();
                      }
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Don’t have an account? ',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()    
                            ..onTap = () {
                              Get.to(SignUp());
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color.fromARGB(201, 156, 156, 144),
                          thickness: 1,
                          endIndent: 10,
                        ),
                      ),
                      Text(
                        'Or login with',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color.fromARGB(201, 156, 156, 144),
                          thickness: 1,
                          indent: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.facebook_outlined,
                          color: Colors.blueAccent,
                          size: 36,
                        ),
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.tiktok,
                          color: Colors.blueAccent,
                          size: 36,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
