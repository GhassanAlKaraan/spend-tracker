import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/color_manager.dart';
import 'package:flutterfire_template/resources/styles_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.displayLarge
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Profile Page",
              style: getRegularStyle(color: ColorManager.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () async{
              //! logout
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.clear();
            }, child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}