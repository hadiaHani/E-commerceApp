import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce_admin_app_firebase/core/extension/extension.dart';

class AppSettingsSharedPreferences {
  final SharedPreferences _sharedPreferences;

  AppSettingsSharedPreferences(this._sharedPreferences);

  Future<void> setToken(String token) async {
    await _sharedPreferences.setString(ConstantsPrefsKeys.tokenKey, token);
  }

  String getToken() {
    return _sharedPreferences.getString(ConstantsPrefsKeys.tokenKey).onNull();
  }

  Future<void> setPhone(String phone) async {
    await _sharedPreferences.setString(ConstantsPrefsKeys.phone, phone);
  }

  String getPhone() {
    return _sharedPreferences.getString(ConstantsPrefsKeys.phone).onNull();
  }

  Future<void> setPassword(String password) async {
    await _sharedPreferences.setString(ConstantsPrefsKeys.password, password);
  }

  String getPassword() {
    return _sharedPreferences.getString(ConstantsPrefsKeys.password).onNull();
  }

  Future<void> setLoggedIn(bool isLoggedIn) async {
    await _sharedPreferences.setBool(ConstantsPrefsKeys.loggedIn, isLoggedIn);
  }

  bool loggedIn() {
    return _sharedPreferences.getBool(ConstantsPrefsKeys.loggedIn).onNull();
  }

  void clear() {
    _sharedPreferences.clear();
    setLoggedIn(false);
  }
}
