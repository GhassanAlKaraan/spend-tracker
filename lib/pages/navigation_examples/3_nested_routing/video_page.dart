import 'package:flutter/material.dart';

//@RoutePage()
class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Video",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}