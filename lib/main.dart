import 'dart:io';

import 'package:flutter/material.dart';
import 'package:transcoder/common/styling.dart';
import 'package:window_size/window_size.dart';
import 'package:transcoder/widgets/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isMacOS) {
    setWindowTitle('Transcoder');
    setWindowMaxSize(const Size(600, 800));
    setWindowMinSize(const Size(600, 800));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transcoder',
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
