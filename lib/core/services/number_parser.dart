class NumberParser {
  NumberParser._();

  static final instance = NumberParser._();

  String convertToArabicNumbers({required String input}) {
    const _english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const _arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < _english.length; i++) {
      input = input.replaceAll(_english[i], _arabic[i]);
    }

    return input;
  }
}
