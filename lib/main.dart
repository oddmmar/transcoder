import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'package:transcoder/common/styling.dart';
import 'package:transcoder/widgets/home_screen.dart';
import 'package:transcoder/helpers/ffmpeg_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isMacOS || Platform.isLinux) {
    setWindowTitle('Transcoder');
    setWindowMaxSize(const Size(600, 800));
    setWindowMinSize(const Size(600, 800));
  }

  runApp(const AppStartup());
}

class AppStartup extends StatefulWidget {
  const AppStartup({super.key});

  @override
  State<AppStartup> createState() => _AppStartupState();
}

// init logic here
class _AppStartupState extends State<AppStartup> {
  void onStart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accels = await FfmpegHelper.getAcceleration();
    await prefs.setStringList('acceleration', accels!);
  }

  @override
  void initState() {
    super.initState();
    onStart();
  }

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

// app
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
