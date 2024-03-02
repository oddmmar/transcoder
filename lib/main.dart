import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'package:transcoder/widgets/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isMacOS) {
    setWindowMaxSize(const Size(600, 700));
    setWindowMinSize(const Size(600, 700));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transcoder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
