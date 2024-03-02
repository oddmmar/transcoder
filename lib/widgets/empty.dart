import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 200),
      child: Card(
        elevation: 5,
        child: SizedBox(
          height: 200,
          width: 550,
          child: Center(
            child: Text(
              'Drop Media Files Here!',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
