import 'package:flutter/material.dart';

import 'package:cross_file/cross_file.dart';
import 'package:transcoder/widgets/empty.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:transcoder/models/media_aseet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transcoder/widgets/media_file_list_item.dart';

class DropArea extends StatefulWidget {
  const DropArea({super.key});

  @override
  State<DropArea> createState() => _DropAreaState();
}

class _DropAreaState extends State<DropArea> {
  final Set<XFile> _list = {};

  final Set<MediaAsset> _mediaAssets = {};

  void _getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? accels = prefs.getStringList('acceleration');
    debugPrint('in nav -> ${accels.toString()}');
  }

  @override
  void initState() {
    super.initState();
    _getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropTarget(
        onDragDone: (detail) async {
          for (final file in detail.files) {
            // TODO: create a media asset
            MediaAsset ma = MediaAsset(
              originalSize: 1024.5,
              duration: 600,
              videoTracks: 1,
              audioTracks: 2,
              resolution: 1080,
              originalName: file.name,
              sourcePath: file.path,
              destinationPath: '/some/destination/',
              extention: '.movi',
              engDate: DateTime.now(),
            );
            _mediaAssets.add(ma);
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_list.isEmpty)
                    const Empty()
                  else
                    for (var ma in _mediaAssets)
                      MediaAssetListItem(mediaAsset: ma)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
