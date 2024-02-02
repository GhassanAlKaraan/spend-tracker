import 'package:flutter/material.dart';
import 'package:spend_tracker/resources/routes_manager/app_router.dart';
import 'package:spend_tracker/resources/theme_manager.dart';

class App extends StatelessWidget {
  
  const App._internal();
  static const App instance = App._internal();
  factory App() => instance;
  
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
