


class MovieUtils {

   static RegExp regex = RegExp(r'(?<=/)[^/]+(?=/[^/]*$)');

  static List<String> charatersUrlsToIds(List<String> charactersUrls) {
    final Iterable<String> ids = charactersUrls.map((String url) {
      final List<String> pathSegments = Uri.parse(url).pathSegments;
      return pathSegments[2];
    });

    return ids.toList();
  }
}