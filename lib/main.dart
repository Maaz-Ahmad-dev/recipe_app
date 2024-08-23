import 'package:dep_task_three/screens/home_screen.dart';
import 'package:dep_task_three/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('saved');
  final pref = await SharedPreferences.getInstance();
  final value = pref.getBool('isOnboardingGone') ?? false;
  runApp(MyApp(keyVal: value));
}

class MyApp extends StatelessWidget {
  final bool keyVal;
  const MyApp({super.key, required this.keyVal});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: keyVal ? const HomeScreen() : const OnboardingScreen(),
    );
  }
}
