import 'package:flutter/material.dart';

void main() {
  runApp(const OnlineGraduationApp());
}

class OnlineGraduationApp extends StatelessWidget {
  const OnlineGraduationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Graduation App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Placeholder(),
    );
  }
}
