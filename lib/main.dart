import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:memoneet_task/service/auth_check_service.dart';
import 'package:memoneet_task/utils/app_providers.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'service/streak_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // (await SharedPreferences.getInstance()).clear();
  StreakManager().init();
  runApp(MultiProvider(
    providers: AppProviders.providers,
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthProvider(),
    );
  }
}
