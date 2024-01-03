import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/color_manager.dart';
import 'package:flutterfire_template/resources/font_manager.dart';
import 'package:flutterfire_template/resources/routes_manager/1_navbar_routing/app_router.gr.dart';
import 'package:flutterfire_template/resources/styles_manager.dart';

@RoutePage()
class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                onPressed: () {
                  context.router.replace(const AudioRoute());
                },
                child: Text(
                  "Audio",
                  style: getRegularStyle(
                      color: ColorManager.white, fontSize: FontSize.s16),
                ),
              ),
              const SizedBox(height: 15),
                ElevatedButton(
                onPressed: () {
                  context.router.replace(const VideoRoute());
                },
                child: Text(
                  "Video",
                  style: getRegularStyle(
                      color: ColorManager.white, fontSize: FontSize.s16),
                ),
              ),


              ],
            ),
            const Expanded(
              // nested routes will be rendered here
              child: AutoRouter(),
            )
          ],
        ),
      ),
    );
  }
}