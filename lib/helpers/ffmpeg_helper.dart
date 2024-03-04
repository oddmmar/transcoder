import 'dart:io';

typedef FfmpegQueries = Map<String, List<String>>;
String _hideBanner = '-hide_banner';
FfmpegQueries ffQueries = {
  'hwaccels': [_hideBanner, '-hwaccels']
};

class FfmpegHelper {
  // returns a trimmed list of hardware acceleration options available on said
  // machine.
  static Future<List<String>?> getAcceleration() async {
    List<String>? entries;

    return Process.run('ffmpeg', ffQueries['hwaccels']!).then((value) {
      if (value.stderr == null) return null;
      entries = value.stdout.toString().split('\n');
      entries!.removeWhere((element) => ['', ' '].contains(element));
      return entries!.sublist(1);
    });
  }
}
