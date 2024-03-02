import 'package:flutter/material.dart';
import 'package:transcoder/widgets/command_section.dart';

import 'package:transcoder/widgets/drop_area.dart';
import 'package:transcoder/widgets/home_page_divider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive Helper'),
        backgroundColor: Colors.black,
      ),
      body: const Column(
        children: [
          HomePageDivider(),
          Expanded(
            flex: 8,
            child: DropArea(),
          ),
          HomePageDivider(),
          Expanded(
            flex: 1,
            child: CommandSEction(),
          ),
        ],
      ),
    );
  }
}
