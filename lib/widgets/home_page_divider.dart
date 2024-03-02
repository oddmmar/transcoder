import 'package:flutter/material.dart';

class HomePageDivider extends StatelessWidget {
  const HomePageDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Divider(
        color: Colors.red,
        height: 1,
      ),
    );
  }
}
