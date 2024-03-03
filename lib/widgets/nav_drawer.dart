import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final drawerItems = const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      DrawerHeader(),
      DestinationChoice(),
      FormatChoice(),
      Acceleration(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      child: drawerItems,
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      color: const Color.fromARGB(255, 17, 1, 45),
      child: const Center(
        child: Text(
          'Options',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class Acceleration extends StatefulWidget {
  const Acceleration({super.key});

  @override
  State<Acceleration> createState() => _AccelerationState();
}

class _AccelerationState extends State<Acceleration> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: const Column(
        children: [
          Text(
            'ACCELERATION',
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}

class DestinationChoice extends StatefulWidget {
  const DestinationChoice({super.key});

  @override
  State<DestinationChoice> createState() => _DestinationChoiceState();
}

class _DestinationChoiceState extends State<DestinationChoice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: const Column(
        children: [
          Text(
            'DESTINATION',
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}

class FormatChoice extends StatefulWidget {
  const FormatChoice({super.key});

  @override
  State<FormatChoice> createState() => _FormatChoiceState();
}

class _FormatChoiceState extends State<FormatChoice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: const Column(
        children: [
          Text(
            'FORMAT',
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
