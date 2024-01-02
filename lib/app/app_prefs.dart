// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";

// Not used
const String PREFS_TOKEN = "PREFS_TOKEN";
const String PREFS_LANG = "PREFS_LANG";
const String PREFS_ONBOARDING_PAGE = "PREFS_ONBOARDING_PAGE";


class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // add token expiry date
  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PREFS_IS_USER_LOGGED_IN);
  }

  //   Future<void> setIsUserLoggedIn({required String token, required DateTime expiry}) async {
  //   _sharedPreferences.setBool(PREFS_IS_USER_LOGGED_IN, true);
  //   await _sharedPreferences.setString(PREFS_TOKEN, token); // Store token
  //   await _sharedPreferences.setString(PREFS_TOKEN_EXPIRY, expiry.toIso8601String()); // Store expiry
  // }

  // Future<bool> isUserLoggedIn() async {
  //   final isLoggedIn = _sharedPreferences.getBool(PREFS_IS_USER_LOGGED_IN) ?? false;
  //   if (isLoggedIn) {
  //     final expiryString = _sharedPreferences.getString(PREFS_TOKEN_EXPIRY) ?? "";
  //     final expiry = DateTime.tryParse(expiryString);
  //     if (expiry != null && expiry.isBefore(DateTime.now())) {
  //       // Token has expired, clear preferences
  //       await logout();
  //       return false;
  //     }
  //   }
  //   return isLoggedIn;
  // }

  // Future<void> logout() async {
  //   await _sharedPreferences.remove(PREFS_IS_USER_LOGGED_IN);
  //   await _sharedPreferences.remove(PREFS_TOKEN); // Clear token
  //   await _sharedPreferences.remove(PREFS_TOKEN_EXPIRY); // Clear expiry
  // }
}
