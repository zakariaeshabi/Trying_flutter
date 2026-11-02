import 'package:flutter/material.dart';

import 'screens/courses_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMSI Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00796B),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      home: const CoursesPage(),
    );
  }
}