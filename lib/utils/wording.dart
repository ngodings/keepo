import 'dart:math';

import 'package:age_calculator/age_calculator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/utils/app_assets.dart';

const int lengthMessage = 4096;
const int lengthGroupName = 250;
final int otpTime = DateTime.now().millisecondsSinceEpoch + 500 * 30;

const listDay = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

String convertUsername(String? text) {
  debugPrint("USERNAME : $text");
  String a, b, displayUsername = '';
  if (text != null) {
    if (text.isNotEmpty) {
      a = text.split('#').first;
      b = text.split('#').last.insert('#', 0);
      if (a.length > 11) {
        displayUsername = '${a.substring(0, 11)}...$b';
      } else {
        displayUsername = '$a$b';
      }
    }
  }
  return displayUsername;
}

String convertEmail(String? text) {
  String a, b, displayUsername = '';
  if (text != null) {
    a = text.split('@').first;
    b = text.split('@').last.insert('@', 0);
    if (a.length > 11) {
      if (b.length <= 11) {
        var c = a.length + 3 - b.length;
        displayUsername = '${a.substring(0, c)}...$b';
      } else {
        displayUsername = '${a.substring(0, 11)}...$b';
      }
    } else {
      displayUsername = '$a$b';
    }
  }
  return displayUsername;
}

const List<int> signDays = [0, 20, 19, 21, 20, 21, 22, 23, 23, 23, 24, 22, 22];
const List<String> signYears = [
  "1912-02-18",
  "1913-02-06",
  "1914-01-26",
  "1915-02-14",
  "1916-02-03",
  "1917-01-23",
  "1918-02-11",
  "1919-02-01",
  "1920-02-20",
  "1921-02-08",
  "1922-01-28",
  "1923-02-16",
  "1924-02-05",
  "1925-01-25",
  "1926-02-13",
  "1927-02-02",
  "1928-01-23",
  "1929-02-10",
  "1930-01-30",
  "1931-02-17",
  "1932-02-06",
  "1933-01-26",
  "1934-02-14",
  "1935-02-04",
  "1936-01-24",
  "1937-02-11",
  "1938-01-31",
  "1939-02-19",
  "1940-02-08",
  "1941-01-27",
  "1942-02-15",
  "1943-02-05",
  "1944-01-25",
  "1945-02-13",
  "1946-02-02",
  "1947-01-22",
  "1948-02-10",
  "1949-01-29",
  "1950-02-17",
  "1951-02-06",
  "1952-01-27",
  "1953-02-14",
  "1954-02-03",
  "1955-01-24",
  "1956-02-12",
  "1957-01-31",
  "1958-02-18",
  "1959-02-08",
  "1960-01-28",
  "1961-02-15",
  "1962-02-05",
  "1963-01-25",
  "1964-02-13",
  "1965-02-02",
  "1966-01-21",
  "1967-02-09",
  "1968-01-30",
  "1969-02-17",
  "1970-02-06",
  "1971-01-27",
  "1972-01-16",
  "1973-02-03",
  "1974-01-23",
  "1975-02-11",
  "1976-01-31",
  "1977-02-18",
  "1978-02-07",
  "1979-01-28",
  "1980-02-16",
  "1981-02-05",
  "1982-01-25",
  "1983-02-13",
  "1984-02-02",
  "1985-02-20",
  "1986-02-09",
  "1987-01-29",
  "1988-02-17",
  "1989-02-06",
  "1990-01-27",
  "1991-02-15",
  "1992-02-04",
  "1993-01-23",
  "1994-02-10",
  "1995-01-31",
  "1996-02-19",
  "1997-02-07",
  "1998-01-28",
  "1999-02-16",
  "2000-02-05",
  "2001-01-24",
  "2002-02-12",
  "2003-02-01",
  "2004-01-22",
  "2005-02-09",
  "2006-01-29",
  "2007-02-18",
  "2008-02-07",
  "2009-01-26",
  "2010-02-14",
  "2011-02-03",
  "2012-01-23",
  "2013-02-10",
  "2014-01-31",
  "2015-02-19",
  "2016-02-08",
  "2017-01-28",
  "2018-02-16",
  "2019-02-05",
  "2020-01-25",
  "2021-02-12",
  "2022-02-01",
  "2023-01-22",
];

String getHoroscopeSign(DateTime birthdate) {
  const List<String> signNames = [
    "Capricorn",
    "Aquarius",
    "Pisces",
    "Aries",
    "Taurus",
    "Gemini",
    "Cancer",
    "Leo",
    "Virgo",
    "Libra",
    "Scorpius",
    "Sagittarius",
    "Capricorn"
  ];

  if (birthdate.day < signDays[birthdate.month]) {
    return signNames[birthdate.month - 1];
  } else {
    return signNames[birthdate.month];
  }
}

String getHoroscopeSignIcon(String signNames) {
  switch (signNames) {
    case "Capricorn":
      return AppSvg.capricorn;
    case "Aquarius":
      return AppSvg.aquarius;
    case "Pisces":
      return AppSvg.pisces;
    case "Aries":
      return AppSvg.aries;
    case "Taurus":
      return AppSvg.taurus;
    case "Gemini":
      return AppSvg.gemini;
    case "Cancer":
      return AppSvg.cancer;
    case "Leo":
      return AppSvg.leo;
    case "Virgo":
      return AppSvg.virgo;
    case "Libra":
      return AppSvg.libra;
    case "Scorpius":
      return AppSvg.scorpio;
    case "Sagittarius":
      return AppSvg.sagittarius;
    default:
      return AppSvg.capricorn;
  }
}

String getChineseZodiacSign(DateTime birthdate) {
  const List<String> signNames = [
    "Rat",
    "Ox",
    "Tiger",
    "Rabbit",
    "Dragon",
    "Snake",
    "Horse",
    "Goat",
    "Monkey",
    "Rooster",
    "Dog",
    "Boar",
    "Rat",
    "Ox",
    "Tiger",
    "Rabbit",
    "Dragon",
    "Snake",
    "Horse",
    "Goat",
    "Monkey",
    "Rooster",
    "Dog",
    "Boar",
    "Rat",
    "Ox",
    "Tiger",
    "Rabbit",
    "Dragon",
    "Snake",
    "Horse",
    "Goat",
    "Monkey",
    "Rooster",
    "Dog",
    "Boar",
    "Rat",
    "Ox",
    "Tiger",
    "Rabbit",
    "Dragon",
    "Snake",
    "Horse",
    "Goat",
    "Monkey",
    "Rooster",
    "Dog",
    "Boar",
    "Rat",
    "Ox",
    "Tiger",
    "Rabbit",
    "Dragon",
    "Snake",
    "Horse",
    "Goat",
    "Monkey",
    "Rooster",
    "Dog",
    "Boar",
    "Rat",
    "Ox",
    "Tiger",
    "Rabbit",
    "Dragon",
    "Snake",
    "Horse",
    "Goat",
    "Monkey",
    "Rooster",
    "Dog",
    "Boar",
    "Rat",
    "Ox",
    "Tiger",
    "Rabbit",
    "Dragon",
    "Snake",
    "Horse",
    "Goat",
    "Monkey",
    "Rooster",
    "Dog",
    "Boar",
    "Rat",
    "Ox",
    "Tiger",
    "Rabbit",
    "Dragon",
    "Snake",
    "Horse",
    "Goat",
    "Monkey",
    "Rooster",
    "Dog",
    "Boar",
    "Rat",
    "Ox",
    "Tiger",
    "Rabbit",
    "Dragon",
    "Snake",
    "Horse",
    "Goat",
    "Monkey",
    "Rooster",
    "Dog",
    "Pig",
    "Rat",
    "Ox",
    "Tiger",
    "Rabbit",
  ];
  DateTime birthdateAfter = DateTime.parse(birthdate.toIso8601String());

  debugPrint("DATE B4 PARSE ===> ${birthdateAfter}");
  // try {
  if (birthdate.isBefore(DateTime.parse(signYears[birthdate.year - 1912]))) {
    return signNames[birthdate.year - 1912 - 1];
  } else {
    return signNames[birthdate.year - 1912];
  }
  // } catch (e) {
  //   debugPrint("ERROR GETTING CHINESE ZODIAC ==> $e");
  //   return signNames[0];
  // }
}

DateFormat formatddMMMMyyyy = DateFormat('dd MMMM yyyy');
DateFormat formatddMMyyyy = DateFormat('dd MM yyyy');
DateFormat formatdM = DateFormat('d/M');
DateFormat formatMMMMyyyy = DateFormat('MMMM yyyy');
DateFormat formatyMd = DateFormat('yMd');
DateFormat formatDayUS = DateFormat('EEEE', 'en_us');

NumberFormat formatCurrency = NumberFormat.currency(
  symbol: '',
  decimalDigits: 2,
);

NumberFormat formatCurrencyNoDecimal = NumberFormat.currency(
  symbol: '',
  decimalDigits: 0,
);

String formatCurrencyConvertM(String? amount) {
  double parse = amount == null ? 0 : (double.tryParse(amount) ?? 0);
  double m1 = 1000000;
  var result = parse > m1
      ? '${formatCurrency.format(parse / m1)} m'
      : formatCurrency.format(parse);

  return result;
}

String formatCurrencyRoundDown(num? amount) {
  var findDot = amount.toString().indexOf('.');
  var cache = amount == null
      ? '0'
      : amount.toString().split('.').last.length < 2
          ? amount.toString()
          : amount.toString().substring(0, findDot + 3);
  var parse = double.parse(cache);
  var result = formatCurrency.format(parse);
  return result;
}

String getFormatDate(String date) {
  DateTime parsedDate = DateTime.parse(date);
  String formattedDate =
      DateFormat("dd MMM yyyy hh:mm a").format(parsedDate.toLocal());
  return formattedDate;
}

String getFormatDateOnly(String date) {
  DateTime parsedDate = DateTime.parse(date);
  String formattedDate = DateFormat("dd MMM yyyy").format(parsedDate);
  return formattedDate;
}

String getFormatNewDateProfileOnly(String date) {
  DateTime parsedDate = DateTime.parse(date);
  String formattedDate = DateFormat("dd MMMM yyyy").format(parsedDate);
  return "$formattedDate (${"age".tr()} ${AgeCalculator.age(parsedDate).years})";
}

String formattedAccountNumber(String accountNumber) {
  return "${accountNumber.substring(0, 2)}-xxxxxx-${accountNumber.substring(accountNumber.length - 2)}";
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      debugPrint("true");
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.simpleCurrency(name: 'SGD');

    String newText = formatter.format(value / 100);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

final random = Random.secure();

// const letterLowerCase = "abcdefghijklmnopqrstuvwxyz";
const number = '0123456789';

String generateRandomTagline({
  required int length,
  required String name,
}) {
  final allValidCharacters = '$name$number';

  var rest = [
    for (var i = 0; i < length; i += 1)
      allValidCharacters[random.nextInt(allValidCharacters.length)],
  ];

  return ((rest)..shuffle(random)).join();
}

String getFormatPhone(String phone) {
  String maskedPhoneNumber =
      phone.substring(0, phone.length - 3).replaceAll(RegExp(r'.'), '*') +
          phone.substring(phone.length - 3);

  return maskedPhoneNumber;
}
