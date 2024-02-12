import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spend_tracker/providers/record_provider.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RecordProvider()),
    ],
    child: App(),
  ));
}
