import 'package:flutter/material.dart';
import 'package:online_graduation/utils/color_constant.dart';

import 'navigation.dart';
import 'screens/login/login_screen.dart';
import 'screens/setting/setting_screen.dart';

void main() {
  runApp(const OnlineGraduationApp());
}

class OnlineGraduationApp extends StatelessWidget {
  const OnlineGraduationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Graduation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
          secondary: Colors.purple,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: BLACK,
              fontFamily: 'SCoreDream',
            ),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => const Navigation(),
        '/login': (context) => const LoginScreen(),
        '/setting': (conetxt) => const SettingScreen(),
      },
    );
  }
}
