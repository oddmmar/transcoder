import 'package:flutter/material.dart';
import 'package:transcoder/common/styling.dart';

class CommandSEction extends StatelessWidget {
  const CommandSEction({super.key});

  // clear media asset list
  void _clearList() {
    debugPrint('clear list');
  }

  // start media asset conversion
  void _convertFiles() {
    debugPrint('convert files');
  }

  Widget _buildCommandButton(
      {required String label, required Function() buttonAction}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        height: 45,
        child: ElevatedButton(
          onPressed: buttonAction,
          style: buttonStyle,
          child: Text(label),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        children: [
          Expanded(
            child: _buildCommandButton(
              label: 'CLEAR',
              buttonAction: _clearList,
            ),
          ),
          Expanded(
            child: _buildCommandButton(
              label: 'CONVERT',
              buttonAction: _convertFiles,
            ),
          ),
        ],
      ),
    );
  }
}
