import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:transcoder/widgets/empty.dart';

class DropArea extends StatefulWidget {
  const DropArea({super.key});

  @override
  State<DropArea> createState() => _DropAreaState();
}

class _DropAreaState extends State<DropArea> {
  final List<XFile> _list = [];

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: (detail) async {
        for (final file in detail.files) {
          debugPrint('${file.path} ${file.name}');
        }
        setState(() {
          _list.addAll(detail.files);
        });
      },
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (_list.isEmpty)
                const Empty()
              else
                Text(
                  _list.map((e) => e.path).join("\n"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
