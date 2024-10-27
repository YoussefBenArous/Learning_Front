import 'package:flutter_application_learning/core/storage/storage.dart';

class AppStorage {
  static const String keyName = "name";
  static const String keyEmail = "email";
  static const String keyUser = "user";


  static saveName(String name) {
    SecureStorage.writeSecureData(key: keyName, value: name);
  }

  static String? readName() {
    return SecureStorage.readSecureData(keyName);
  }

  static saveEmail(String email) {
    SecureStorage.writeSecureData(key: keyEmail, value: email);
  }

  static String? readEmail() {
    return SecureStorage.readSecureData(keyEmail);
  }
  static saveUser(String user) {
    SecureStorage.writeSecureData(key: keyUser, value: user);
  }

  static String? readUser() {
    return SecureStorage.readSecureData(keyUser);
  }
}
