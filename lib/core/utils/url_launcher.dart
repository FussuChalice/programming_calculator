import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> launchGithubRepository() async {
    final Uri url = Uri.parse('https://github.com/FussuChalice');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch github repository for this project');
    }
  }
}
