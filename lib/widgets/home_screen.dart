import 'package:flutter/material.dart';

import 'package:transcoder/common/styling.dart';
import 'package:transcoder/widgets/drop_area.dart';
import 'package:transcoder/widgets/command_section.dart';
import 'package:transcoder/widgets/drawer/nav_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Archive Helper'),
        backgroundColor: Colors.black,
      ),
      body: const Column(
        children: [
          CustomDivider(dividerColor: Colors.grey),
          Expanded(
            flex: 7,
            child: DropArea(),
          ),
          CustomDivider(dividerColor: Colors.grey),
          Expanded(
            flex: 1,
            child: CommandSection(),
          ),
        ],
      ),
      drawer: const NavDrawer(),
    );
  }
}
