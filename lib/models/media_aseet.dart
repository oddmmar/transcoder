class MediaAsset {
  int? id;
  final int originalSize;
  final int newSize;
  final int duration;
  final int videoTracks;
  final int audioTracks;
  final int resolution;
  final String originalName;
  final String newName;
  final String sourcePath;
  final String destinationPath;
  final String extention;
  final DateTime engDate;
  final DateTime convertionDate;
  final bool didTranscode = false;

  MediaAsset({
    required this.originalSize,
    required this.newSize,
    required this.duration,
    required this.videoTracks,
    required this.audioTracks,
    required this.resolution,
    required this.originalName,
    required this.newName,
    required this.sourcePath,
    required this.destinationPath,
    required this.extention,
    required this.engDate,
    required this.convertionDate,
  });
}
