import 'package:flutter_application_learning/core/networking/app_api.dart';
import 'package:flutter_application_learning/models/formation/formation_model.dart';
import 'package:flutter_application_learning/models/cour/cour_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/state_manager.dart';
class HomeController extends GetxController {
  dio.Dio? _dio;
  GetFormation? formationsModel;
  GetCour? courModel;
  @override
  void onInit() {
    _dio = dio.Dio();
    super.onInit();
  }
  Future<GetFormation?> getFormations() async {
    try {
      dio.Response response = await _dio!.get(AppApi.FormationURL);
      if (response.statusCode == 200) {
        formationsModel = 
            GetFormation.fromJson(response.data);
            
        print('formations $formationsModel');
        return formationsModel;
      }
      return null;
    } catch (e) {
      print("error $e");
      return null;
    }
  }
  Future<GetCour?> getcour() async {
    try {
      dio.Response response = await _dio!.get(AppApi.CourURL);
      if (response.statusCode == 200) {
        courModel = 
            GetCour.fromJson(response.data);
            
        print('formations $courModel');
        return courModel;
      }
      return null;
    } catch (e) {
      print("error $e");
      return null;
    }
  }
}