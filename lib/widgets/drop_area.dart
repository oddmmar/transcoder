import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:transcoder/models/media_aseet.dart';
import 'package:transcoder/widgets/empty.dart';
import 'package:transcoder/widgets/media_file_list_item.dart';

class DropArea extends StatefulWidget {
  const DropArea({super.key});

  @override
  State<DropArea> createState() => _DropAreaState();
}

class _DropAreaState extends State<DropArea> {
  final Set<XFile> _list = {};

  final Set<MediaAsset> _mediaAssets = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropTarget(
        onDragDone: (detail) async {
          for (final file in detail.files) {
            debugPrint('${file.path} ${file.name}');
          }
          setState(() {
            _list.addAll(detail.files);
            MediaAsset ma = MediaAsset(
              originalSize: 1024.5,
              duration: 600,
              videoTracks: 1,
              audioTracks: 2,
              resolution: 1080,
              originalName: detail.files.first.name,
              sourcePath: '/some/path',
              destinationPath: '/some/destination/',
              extention: '.movi',
              engDate: DateTime.now(),
            );
            _mediaAssets.add(ma);
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
                  for (var ma in _mediaAssets)
                    MediaAssetListItem(mediaAsset: ma)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
