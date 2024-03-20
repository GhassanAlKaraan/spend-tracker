// // ignore_for_file: constant_identifier_names

// import 'package:shared_preferences/shared_preferences.dart';


// const String PREFS_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";


// class AppPreferences {
//   final SharedPreferences _sharedPreferences;

//   AppPreferences(this._sharedPreferences);


//   Future<void> setIsUserLoggedIn() async {
//     _sharedPreferences.setBool(PREFS_IS_USER_LOGGED_IN, true);
//   }

//   Future<bool> isUserLoggedIn() async {
//     return _sharedPreferences.getBool(PREFS_IS_USER_LOGGED_IN) ?? false;
//   }

//   Future<void> logout() async {
//     _sharedPreferences.remove(PREFS_IS_USER_LOGGED_IN);
//   }
// }
