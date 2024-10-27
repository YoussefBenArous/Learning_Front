import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_learning/core/networking/app_api.dart';
import 'package:flutter_application_learning/core/wedgets/costom_input_text.dart';
import 'package:flutter_application_learning/screens/home/profile/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;
  bool __obscureText = true;
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? confirmepasswordController;
  TextEditingController? roleController;

  String? selectedRole;
  Dio? dio;

  final keyForm3 = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmepasswordController = TextEditingController();
    dio = Dio();
    selectedRole = selectedRole; // Default role selection
    super.initState();
  }

  signup() async {
    try {
      Map<String, String> data = {
        "name": nameController!.text,
        "email": emailController!.text,
        "password": passwordController!.text,
        "confirmpassword": confirmepasswordController!.text,
        "role": selectedRole!,
      };
      Response response = await dio!.post(
        AppApi.SignupURL,
        data: data,
      );
      if (response.statusCode == 200) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
        print('Registration successfully');
      }
    } catch (e) {
      print('error ======>$e ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: keyForm3,
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 700,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Image.asset(
                        "assets/image/register.png",
                        width: 180,
                        height: 180,
                      ),
                    SizedBox(height: 30),
                    CustomInputText(
                      label: 'Name',
                      hintText: 'Enter Your Name',
                      prefixIcon: Icons.account_circle,
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      borderRadius: BorderRadius.circular(15),
                    ),
                    SizedBox(height: 30),
                    CustomInputText(
                      label: 'Email',
                      hintText: 'Enter Your Email',
                      prefixIcon: Icons.email,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid email';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      borderRadius: BorderRadius.circular(15),
                    ),
                    SizedBox(height: 30),
                    CustomInputText(
                      label: 'Password',
                      hintText: 'Enter Your Password',
                      prefixIcon: Icons.lock,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid password';
                        }
                        if (!RegExp(
                                r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$')
                            .hasMatch(value)) {
                          return 'Please use a password with more security';
                        }
                        return null;
                      },
                      obscureText: _obscureText,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(_obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    SizedBox(height: 30),
                    CustomInputText(
                      label: 'Password Confirme',
                      hintText: 'Confirm Your Password',
                      prefixIcon: Icons.lock,
                      controller: confirmepasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (passwordController?.text !=
                            confirmepasswordController?.text) {
                          return 'Password and confirmation do not match';
                        }
                        return null;
                      },
                      obscureText: __obscureText,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            __obscureText = !__obscureText;
                          });
                        },
                        icon: Icon(__obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    SizedBox(height: 30),
                    // creat select button
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 3,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                        ),
                        labelText: 'Select Role',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blueAccent,
                        ),
                      ),
                      value: selectedRole,
                      items: [
                        DropdownMenuItem(
                          value: 'User',
                          child: Text('User'),
                        ),
                        DropdownMenuItem(
                          value: 'formateur',
                          child: Text('Formateur'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedRole =
                              value; // Set selectedRole to the chosen value
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a role';
                        }
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (keyForm3.currentState!.validate()) {
                          signup();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                        minimumSize: MaterialStateProperty.all(
                          Size(327, 60),
                        ),
                        elevation: MaterialStatePropertyAll(0),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Create account',
                        style: TextStyle(
                          fontFamily: AutofillHints.birthday,
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text: 'Log In',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
