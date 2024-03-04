import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transcoder/common/styling.dart';
import 'package:extended_text/extended_text.dart';

class DestinationChoice extends StatefulWidget {
  const DestinationChoice({super.key});

  @override
  State<DestinationChoice> createState() => _DestinationChoiceState();
}

class _DestinationChoiceState extends State<DestinationChoice> {
  String _destinationPath = '';

  void _destinationPicker() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await FilePicker.platform.getDirectoryPath();
    if (result != null) {
      setState(() {
        _destinationPath = result;
        prefs.setString('destination_path', result);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _destinationPath = prefs.getString('destination_path') ??
            '/browse/to/destination/directory';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'DESTINATION',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.grey,
            //     width: 1,
            //   ),
            // ),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Path: '),
                    Expanded(
                      child: ExtendedText(
                        _destinationPath,
                        maxLines: 1,
                        overflowWidget: const TextOverflowWidget(
                          position: TextOverflowPosition.start,
                          child: Text('...'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: buttonStyle,
                    onPressed: _destinationPicker,
                    child: const Text('Browse'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
