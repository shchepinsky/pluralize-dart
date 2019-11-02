import 'package:polyglot/pluralize.dart';
import "package:test/test.dart";

class Txt {
  var hello = {
    'en': 'Hello, you have {count} {mails}',
    'ua': 'Привіт, у вас {count} {mails}',
    'ru': 'Привет, у вас {count} {mails}'
  };

  var mails = pluralize({
    'en': {'1': 'new email', '0': 'new emails'},
    'ua': {'1': 'новий лист', '2': 'нових листа', '5': 'нових листів'},
    'ru': {'1': 'новое письмо', '2': 'новых письма', '5': 'новых писем'}
  });
}

final txt = Txt();

void main() {
  test('English', () {
    final matches = {
      1: 'new email',
      2: 'new emails',
    };

    setLang(currentLanguage);
    for (var count in matches.keys) {
      String expected = txt.hello[currentLanguage].replaceAll('{count}', '$count').replaceAll('{mails}', matches[count]);
      final actual = t(txt.hello, {'count': count, 'mails': txt.mails(count)});

      expect(actual, equals(expected));
    }
  });

  test("Ukrainian", () {
    final lang = 'ua';

    final matches = {
      1: 'новий лист',
      2: 'нових листа',
      3: 'нових листа',
      4: 'нових листа',
      5: 'нових листів',
      6: 'нових листів',
      7: 'нових листів',
      8: 'нових листів',
      9: 'нових листів',
      10: 'нових листів',
      11: 'нових листів',
      12: 'нових листів',
      13: 'нових листів',
      14: 'нових листів',
      15: 'нових листів',
      16: 'нових листів',
      17: 'нових листів',
      18: 'нових листів',
      19: 'нових листів',
      20: 'нових листів',
      21: 'новий лист',
      22: 'нових листа',
      23: 'нових листа',
      24: 'нових листа',
      25: 'нових листів',
      26: 'нових листів',
      27: 'нових листів',
      28: 'нових листів',
      29: 'нових листів',
      30: 'нових листів',
      31: 'новий лист',
      32: 'нових листа',
    };

    setLang(lang);
    for (var count in matches.keys) {
      String expected = txt.hello[lang].replaceAll('{count}', '$count').replaceAll('{mails}', matches[count]);
      String actual = t(txt.hello, {'count': count, 'mails': txt.mails(count)});
      expect(actual, equals(expected));
    }
  });

  test("Russian", () {
    final lang = 'ru';

    final matches = {
      1: 'новое письмо',
      2: 'новых письма',
      3: 'новых письма',
      4: 'новых письма',
      5: 'новых писем',
      6: 'новых писем',
      7: 'новых писем',
      8: 'новых писем',
      9: 'новых писем',
      10: 'новых писем',
      11: 'новых писем',
      12: 'новых писем',
      13: 'новых писем',
      14: 'новых писем',
      15: 'новых писем',
      16: 'новых писем',
      17: 'новых писем',
      18: 'новых писем',
      19: 'новых писем',
      20: 'новых писем',
      21: 'новое письмо',
      22: 'новых письма',
      23: 'новых письма',
      24: 'новых письма',
      25: 'новых писем',
      26: 'новых писем',
      27: 'новых писем',
      28: 'новых писем',
      29: 'новых писем',
      30: 'новых писем',
      31: 'новое письмо',
      32: 'новых письма',
    };

    setLang(lang);
    for (var count in matches.keys) {
      String expected = txt.hello[lang].replaceAll('{count}', '$count').replaceAll('{mails}', matches[count]);
      String actual = t(txt.hello, {'count': count, 'mails': txt.mails(count)});
      expect(actual, equals(expected));
    }
  });
}
