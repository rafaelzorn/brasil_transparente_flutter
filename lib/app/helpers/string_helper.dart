class StringHelper {
  static String capitalize(String string, {bool allWords = false}) {
    if (allWords) {
      List words = string.split(' ');
      List capitalized = [];

      for (var word in words) {
        capitalized.add(capitalize(word));
      }

      return capitalized.join(' ');
    }

    return string.substring(0, 1).toUpperCase() +
        string.substring(1).toLowerCase();
  }
}
