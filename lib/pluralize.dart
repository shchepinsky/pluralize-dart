library polyglot;

var currentLanguage = 'en';

/// Translates token into current language using arguments map
String t(dynamic token, Map<String, dynamic> argMap) {
  // select template from lang map
  String inflated = token[currentLanguage];

  // inject value for each variable in arg map
  for (final argKey in argMap.keys) {
    final argVal = argMap[argKey];

    inflated = inflated.replaceAll('{$argKey}', '$argVal');
  }

  return inflated;
}

Function pluralize_en(Map<String, String> map) {
  String selector(count) => count == 1 ? map['1'] : map['0'];
  return selector;
}

Function pluralize_ua_ru(Map<String, String> digitMap) {
  String selector(count) {
    final ascending = (a, b) => int.parse(a) - int.parse(b);
    final digitList = List<String>.from(digitMap.keys);
    digitList.sort(ascending);

    if (count > 20) {
      count = count % 10;
    }

    final directMatch = digitMap['$count'];
    if (directMatch != null) {
      return directMatch;
    }

    var digit = count;
    for (final char in digitList) {
      final nextDigit = int.parse(char);
      if (count > digit && count < nextDigit) {
        return digitMap['$digit'];
      }

      digit = nextDigit;
    }

    return digitMap['$digit'];
  }

  return selector;
}

final pluraliseHandlerMap = {
  'en': pluralize_en,
  'ua': pluralize_ua_ru,
  'ru': pluralize_ua_ru
};

void setLang(String _lang) {
  currentLanguage = _lang;
}

Function pluralize(Map<String, dynamic> pluraliseByLang) {
  final selector = (count) {
    final pluralizeData = pluraliseByLang[currentLanguage];
    final handler = pluraliseHandlerMap[currentLanguage];

    return handler(pluralizeData)(count);
  };

  return selector;
}
