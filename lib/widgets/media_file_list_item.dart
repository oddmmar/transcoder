import 'package:flutter/material.dart';
import 'package:transcoder/common/styling.dart';
import 'package:transcoder/models/media_aseet.dart';

class MediaAssetListItem extends StatefulWidget {
  const MediaAssetListItem({super.key, required this.mediaAsset});
  final MediaAsset mediaAsset;

  @override
  State<MediaAssetListItem> createState() => _MediaAssetListItemState();
}

class _MediaAssetListItemState extends State<MediaAssetListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Card(
        elevation: 2,
        shadowColor: Colors.purple[900],
        child: SizedBox(
          height: 90,
          width: 580,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    widget.mediaAsset.originalName,
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.start,
                  ),
                ),
                const CustomDivider(
                  dividerColor: Color.fromARGB(255, 76, 2, 74),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
