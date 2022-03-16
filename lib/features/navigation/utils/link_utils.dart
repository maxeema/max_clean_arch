import 'package:dartz/dartz.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class LinkUtils {
  LinkUtils._();

  static const openItemPrefix = "openitem:";

  static bool isOpenItem(String url) => tryExtractOpenItemId(url).isSome();

  static Option<String> tryExtractOpenItemId(String url) {
    if (!url.startsWith(openItemPrefix)) return none();
    //
    try {
      var id = url.substring(openItemPrefix.length);
      id = id.trim();
      if (id.isNotEmpty) {
        return some(id);
      }
    } catch (_) { }
    return none();
  }

  static Future<Option<bool>> tryOpenPlatform(String url) async {
    try {
      final result = await url_launcher.launch(url);
      return some(result);
    } catch (_) {
      return none();
    }
  }
}
