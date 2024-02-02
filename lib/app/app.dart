import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/theme_manager.dart';
import 'package:flutterfire_template/widgets/my_scaffold.dart';

import '../widgets/login_card.dart';

class App extends StatelessWidget {
  // const App({super.key});
  //*
  const App._internal();
  static const App instance = App._internal();
  factory App() => instance;
      //TODO: use router
  //*
  // @override
  // Widget build(BuildContext context) {
  //   AppRouter appRouter = AppRouter();
  //   return MaterialApp.router(
  //     routerConfig: appRouter.config(),
  //     theme: getApplicationTheme(),
  //     debugShowCheckedModeBanner: false,
  //   );
  // }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      home: const MyScaffold(
        barTitle: "app home",
        child: LoginCard(),
      ),
    );
  }
}
