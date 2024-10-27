import 'package:get/get.dart';
import 'package:flutter_application_learning/models/user/user_login_model.dart';
import 'package:flutter_application_learning/core/networking/app_api.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_application_learning/screens/home/profile/login_screen.dart';
import 'package:flutter_application_learning/screens/home/profile/home_screen.dart';
import 'package:flutter_application_learning/core/storage/app_storage.dart';
import 'package:flutter_application_learning/models/user/user_update_model.dart';


class ProfileController extends GetxController { 
  TextEditingController? emailController;
  TextEditingController? passwoedController;
  TextEditingController? nameController;
  TextEditingController? phoneNumberController;
  dio.Dio? _dio;
  UserModel? userLoginModel;
  bool obscureText = true;
  // Observable properties
  var name = ''.obs;
  var email = ''.obs;

  get profilePictureUrl => null;
  
showpassword (){
 
  obscureText = !obscureText;
  
  update();
} 
final keyForm = GlobalKey<FormState>();
final keyForm1 = GlobalKey<FormState>();
final keyForm2 = GlobalKey<FormState>(); 
 login() async {
  try {
    Map<String, String> data = {
      "email": emailController!.text,
      "password": passwoedController!.text, // Corrected the typo here
    };

    print('Sending request to ${AppApi.loginUrl} with data: $data');

    dio.Response response = await _dio!.post(
      AppApi.loginUrl,
      data: data,
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Data: ${response.data}');

    if (response.statusCode == 200) {
      Get.to (HomeScreen());
      print('Login Success');
      userLoginModel = UserModel.fromJson(response.data);
      AppStorage.saveName(userLoginModel!.user!.name!);
      AppStorage.saveEmail(userLoginModel!.user!.email!);
      AppStorage.saveUser(userLoginModel!.user!.sId!);

      // Navigate to the home screen or handle success
    } else {
      print('Login failed with status code: ${response.statusCode}');
      print('Response Data: ${response.data}');
    }
  } catch (e) {
    print("Error: $e");
  }
}
logout() async {
    try {
      dio.Response response = await _dio!.post(
        AppApi.LogoutURL,
      );
      if (response.statusCode == 200) {
        Get.to(LoginScreen());
        print('logOut successfully');
      }
    } catch (e) {
      print('error ======>$e ');
    }
  }
UserModelBYid? modelBYid;
getUser() async {
    try {
      dio.Response response = await _dio!.get(
        "${AppApi.UserURL}${AppStorage.readUser()}",
      );
      if (response.statusCode == 200) 
        print('Get  successfully');
        
        modelBYid = UserModelBYid.fromJson(response.data);
        nameController!.text = modelBYid!.data!.name!;
        emailController!.text = modelBYid!.data!.email!;
      }
     catch (e) {
      print('error ======>$e ');
    }
  }

  updateUser(BuildContext? context) async {
    try {
       Map<String, String> data = {
      "name": nameController!.text,
      "email": emailController!.text// Corrected the typo here
    };
      dio.Response response = await _dio!.put(
        "${AppApi.UserURL}${AppStorage.readUser()}",
        data:data,
      );
      if (response.statusCode == 200) 
      // Update observable properties
        AppStorage.saveName( nameController!.text);
        AppStorage.saveEmail(emailController!.text); 
        print('Update Successfully');
        
        Get.to(HomeScreen()); 
        ScaffoldMessenger.of(context!).showSnackBar(
          const SnackBar(content: Text('Update success')),
        );
        print(userLoginModel!.user!.role);
        
      }
     catch (e) {
      print('error ======>$e ');
    }
  }
 @override
  void onInit() {
    nameController =TextEditingController();
    emailController = TextEditingController();
    passwoedController = TextEditingController();
    _dio = dio.Dio();
    super.onInit();
  }

  void updateProfilePicture(path) {}
}