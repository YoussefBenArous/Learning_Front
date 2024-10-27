import 'package:get_storage/get_storage.dart';

class SecureStorage { 
  static final box = GetStorage();
//souvgarder les donner apres login
  static Future? writeSecureData(
      {required String key, required String value}) async {
    print("i save the $key==  $value ");
    var writeData = await box.write(key, value);
    return writeData;
  }
   static Future? writeDoubleData(
      {required String key, required double value}) async {
    print("i save the $key==  $value ");
    var writeData = await box.write(key, value);
    return writeData;
  }
  static Future? writeBoolData(String key, bool value) async {
    var writeData = await box.write(key, value);
    return writeData;
  }
  static bool? readBoolData(String key) {//read data par key
    var readData = box.read(key);
    return readData;
  }
  static String? readSecureData(String key) {
    var readData = box.read(key);
    return readData;
  }
   static double? readDoubleData(String key) {
    var readData = box.read(key);
    return readData;
  }
  static Future? deleteSecureData(String key) async {
    var deleteData = await box.remove(key);
    return deleteData;
  }
  static Future writeSecureJsonData({required String key, value}) async {
    var writeData = await box.write(key, value);
    return writeData;
  }
  static Map<String, dynamic>? readSecureJsonData(String key) {
    var readData = box.read(key);
    return readData;
  }
}