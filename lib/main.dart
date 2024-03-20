import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spend_tracker/app/app.dart';
import 'package:spend_tracker/pages/login/login_page.dart';
import 'package:spend_tracker/pages/login/v2_login_success.dart';
import 'package:spend_tracker/providers/record_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RecordProvider()),
    ],

    //! Login Demo
    // child: MyApp(),

    
    child: App(),

  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences sharedPreferences;
  bool isLoading = true;
  bool isTokenValid = false;
  @override
  void initState() {
    super.initState();
    _initApp();
  }

  void _initApp() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    isTokenValid = token != null && !_isTokenExpired(token);
    setState(() {
      isLoading = false;
    });
  }

  bool _isTokenExpired(String token) {
    try {
      return JwtDecoder.isExpired(token);
    } catch (e) {
      return true; // Assume invalid
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(body: Center(child: CircularProgressIndicator())));
    }
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      home: isTokenValid
          ? LoginSuccessPage(token: sharedPreferences.getString('token')!)
          : const LoginPage(),
    );
  }
}
