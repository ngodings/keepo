import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/enums/tier_list_ren_enum.dart';
import 'package:keepo/utils/app_assets.dart';
import 'package:keepo/utils/list_string.dart';
import 'package:keepo/utils/themes.dart';

import '../enums/payment/payment_status_enum.dart';
import 'string.dart';

extension UtilExtension on BuildContext {
  // MediaQueryData get mediaQuery => MediaQuery.of(this);
  // Size get screen => mediaQuery.size;
}

List<String> bannedWordsList = [];

getBannedWordsData() async {
  final bannedWordsJson =
      await GetIt.I<FlutterSecureStorage>().read(key: bannedWords);
  bannedWordsList = List<String>.from(jsonDecode(bannedWordsJson ?? ''));
}

extension StringExtension on String {
  bool containsVulgarity() {
    getBannedWordsData();

    final vulgarityWords = [
      'bitch',
      'fuck',
      'abortion',
      'anus',
      'ass',
      'asshole',
      'bastard',
      'bitch',
      'blow job',
      'bollocks',
      'boner',
      'boob',
      'breasts',
      'bugger',
      'bullshit',
      'clit',
      'cocaine',
      'cock',
      'crap',
      'cunt',
      'damn',
      'death',
      'drug',
      'drugs',
      'dick',
      'dildo',
      'dyke',
      'fag',
      'fuck',
      'hairy palms',
      'handjob',
      'hell',
      'hitler',
      'homo',
      'jerk off',
      'jizz',
      'knob',
      'kkk',
      'masturbation',
      'muff',
      'nazi',
      'nazis',
      'nigga',
      'nigger',
      'nipples',
      'oral sex',
      'sex',
      'orgasm',
      'penis',
      'piss',
      'prick',
      'pussy',
      'queer',
      'rape',
      'suicide',
      'scrotum',
      'shit',
      'slut',
      'sodomy',
      'son of a bitch',
      'sperm',
      'tits',
      'twat',
      'vagina',
      'wank',
      'whore',
      'weed',
    ];
    if (bannedWordsList.isEmpty) {
      debugPrint('BANNED WORDS : $bannedWordsList');
    }

    return bannedWordsList.isEmpty
        ? vulgarityWords
            .any((word) => toLowerCase().contains(word.toLowerCase()))
        : bannedWordsList
            .any((word) => toLowerCase().contains(word.toLowerCase()));
  }

  String get capitalize {
    if (isEmpty) {
      return '-';
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get replaceDash {
    if (isEmpty) {
      return '-';
    }

    return replaceAll('-', ' ');
  }

  String get removeFirstBackSlash {
    if (isEmpty) {
      return '-';
    } else if (this[0] == '/') {
      return replaceFirst('/', '');
    }

    return this;
  }

  String get replaceBackSlash {
    if (isEmpty) {
      return '-';
    }

    return replaceAll('/', ' ');
  }

  String get capitalizeFirstOfEach {
    if (isEmpty) {
      return '-';
    }
    return split(" ").map((str) => str.toLowerCase().capitalize).join(" ");
  }

  String get emptyNumber {
    if (isEmpty) {
      return '0';
    }

    return this;
  }

  String get capitalizeFirstAndRemoveUnderscores {
    if (isEmpty) {
      return '-';
    }
    return split("_").map((str) => str.toLowerCase().capitalize).join(" ");
  }

  String getFileExtensionFromUrl() {
    String fileName = Uri.parse(this).pathSegments.last;

    int dotIndex = fileName.lastIndexOf(".");

    if (dotIndex <= 0 || dotIndex == fileName.length - 1) {
      return "";
    }

    return fileName.substring(dotIndex + 1);
  }

  String getFileNameFromUrl() {
    String fileName = Uri.parse(this).pathSegments.last;

    int dotIndex = fileName.lastIndexOf("/");

    if (dotIndex <= 0 || dotIndex == fileName.length - 1) {
      return "";
    }

    return fileName.substring(dotIndex + 1);
  }
}

extension SwappableList<E> on List<E> {
  void swap(int first, int second) {
    final temp = this[first];
    this[first] = this[second];
    this[second] = temp;
  }
}

class CurrencyFormat {
  Decimal d(String s) => Decimal.parse(s);

  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }

  static String convertToUS(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: '',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}

class StringService {
  static String getInitials({required String string, int? limitTo}) {
    var buffer = StringBuffer();
    var split = string.split(' ');
    for (var i = 0; i < (limitTo ?? (split.length < 2 ? 1 : 2)); i++) {
      if (split[i].length > 0) {
        buffer.write(split[i][0]);
      }
    }
    return buffer.toString().toUpperCase();
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}

class FileService {
  static Future<String> getFileSizeString(String filepath, int decimals) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  static Future<String> getFileSizeStringFromResApi(
      int bytes, int decimals) async {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}

class RenService {
  final formatter = NumberFormat('#,##0');

  String getCurrentTier(String tier) {
    String jewel = AppIcons.jewelBasic;
    switch (tier.toEnum()) {
      case TierListEnum.sapphire:
        jewel = AppIcons.jewelSapphire;
        break;
      case TierListEnum.ruby:
        jewel = AppIcons.jewelRuby;
        break;
      case TierListEnum.pearl:
        jewel = AppIcons.jewelPearl;
        break;
      case TierListEnum.emerald:
        jewel = AppIcons.jewelEmerald;
        break;
      case TierListEnum.gold:
        jewel = AppIcons.jewelGold;
        break;
      case TierListEnum.diamond:
        jewel = AppIcons.jewelDiamond;
        break;
      default:
        jewel = AppIcons.jewelBasic;
        break;
    }

    return jewel;
  }
}

class WidgetExtension {
  static Widget underlineTab = Divider(
    thickness: 3,
    color: CustomColor.onBackground.withOpacity(0.1),
  ).pOnly(top: 12.h).w(double.maxFinite);
}

List<Color> getColorTransaction(Enum? status) {
  switch (status) {
    case TransactionStatusEnum.transactionCompleted:
      return gradientFincy;
    case TransactionStatusEnum.transactionAccepted:
      return [Colors.greenAccent, Colors.green];
    case TransactionStatusEnum.transactionPending:
      return myQRColor;
    case TransactionStatusEnum.paymentRequired:
      return myQRColor;
    default:
      return withDrawColor;
  }
}

String getStatusTransaction(Enum? status) {
  switch (status) {
    case TransactionStatusEnum.transactionCompleted:
      return 'transaction_completed';
    case TransactionStatusEnum.transactionAccepted:
      return 'transaction_accepted';
    case TransactionStatusEnum.transactionPending:
      return 'transaction_pending';
    case TransactionStatusEnum.transactionRejected:
      return 'transaction_rejected';
    case TransactionStatusEnum.transactionFailed:
      return 'transaction_failed';
    case TransactionStatusEnum.transactionCancelled:
      return 'transaction_cancelled';
    case TransactionStatusEnum.transactionRefunded:
      return 'transaction_refunded';
    default:
      return 'payment_required';
  }
}

String getZENStatusTransaction(Enum? status) {
  switch (status) {
    case TransactionStatusEnum.transactionCompleted:
      return 'zen_completed_desc';
    case TransactionStatusEnum.transactionAccepted:
      return 'transaction_accepted_desc';
    case TransactionStatusEnum.transactionPending:
      return 'zen_pending_desc';
    case TransactionStatusEnum.transactionRejected:
      return 'zen_rejected_desc';
    case TransactionStatusEnum.transactionFailed:
      return 'transaction_failed_desc';
    case TransactionStatusEnum.transactionCancelled:
      return 'transaction_cancelled_desc';
    case TransactionStatusEnum.transactionRefunded:
      return 'transaction_refunded_desc';
    default:
      return 'payment_required_desc';
  }
}

String getStatusDescTransaction(Enum? status) {
  switch (status) {
    case TransactionStatusEnum.transactionCompleted:
      return 'transaction_completed_desc';
    case TransactionStatusEnum.transactionAccepted:
      return 'transaction_accepted';
    case TransactionStatusEnum.transactionPending:
      return 'transaction_pending_desc';
    case TransactionStatusEnum.transactionRejected:
      return 'transaction_rejected_desc';
    case TransactionStatusEnum.transactionFailed:
      return 'transaction_failed';
    case TransactionStatusEnum.transactionCancelled:
      return 'transaction_cancelled_desc';
    case TransactionStatusEnum.transactionRefunded:
      return 'transaction_refunded';
    default:
      return 'payment_required_desc';
  }
}

Widget getWidgetZENStatus(Enum? status) {
  switch (status) {
    case TransactionStatusEnum.transactionCompleted:
      return SvgPicture.asset(AppSvg.inCardGreen)
          .h(21.sp)
          .pOnly(left: 25.sp, right: 25.sp, top: 14.sp, bottom: 14.sp);
    case TransactionStatusEnum.transactionAccepted:
      return SvgPicture.asset(AppSvg.inCardGreen)
          .h(21.sp)
          .pOnly(left: 25.sp, right: 25.sp, top: 14.sp, bottom: 14.sp);
    case TransactionStatusEnum.transactionPending:
      return SvgPicture.asset(AppSvg.inCardYellow)
          .h(21.sp)
          .pOnly(left: 25.sp, right: 25.sp, top: 14.sp, bottom: 14.sp);
    case TransactionStatusEnum.transactionRejected:
      return SvgPicture.asset(AppSvg.inCardRed)
          .h(21.sp)
          .pOnly(left: 25.sp, right: 25.sp, top: 14.sp, bottom: 14.sp);
    case TransactionStatusEnum.transactionFailed:
      return SvgPicture.asset(AppSvg.inCardRed)
          .h(21.sp)
          .pOnly(left: 25.sp, right: 25.sp, top: 14.sp, bottom: 14.sp);
    case TransactionStatusEnum.transactionCancelled:
      return SvgPicture.asset(AppSvg.inCardRed)
          .h(21.sp)
          .pOnly(left: 25.sp, right: 25.sp, top: 14.sp, bottom: 14.sp);
    case TransactionStatusEnum.transactionRefunded:
      return SvgPicture.asset(AppSvg.inCardRed)
          .h(21.sp)
          .pOnly(left: 25.sp, right: 25.sp, top: 14.sp, bottom: 14.sp);
    default:
      return SvgPicture.asset(AppSvg.inCardYellow)
          .h(21.sp)
          .pOnly(left: 25.sp, right: 25.sp, top: 14.sp, bottom: 14.sp);
  }
}

String getSentenceFromArray(List<String?> list) {
  String value = list.join(',').replaceAll('  ', ',').replaceAll(',', ', ');
  return value;
}

String getValueHeightFt(String heightCm) {
  int indexCm = listHeightCm.indexOf(heightCm);
  String heightFt = listHeightFt[indexCm];
  return heightFt;
}

String getValueWaistInch(String waistCm) {
  int indexCm = listWaistCm.indexOf(waistCm);
  String waist = listWaistInches[indexCm];
  return waist;
}

String getValueShoeSize(String value, List<String> list) {
  int index = shoesSizeCm.indexOf(value);
  String val = list[index];
  return val;
}

String getValueShoeSizeByType(String typeShoe, String val) {
  switch (typeShoe) {
    case "UK":
      return getValueShoeSize(val, shoesSizeUK);
    case "EU":
      return getValueShoeSize(val, shoesSizeEU);
    case "US":
      return getValueShoeSize(val, shoesSizeUSCanada);
    case "Aus":
      return getValueShoeSize(val, shoesSizeAus);
    case "NZ":
      return getValueShoeSize(val, shoesSizeNZ);
    case "China":
      return getValueShoeSize(val, shoesSizeChine);
    case "Japan":
      return getValueShoeSize(val, shoesSizeJapan);
    default:
      return getValueShoeSize(val, shoesSizeCm);
  }
}

String getNumbersOrAlphabetOnly({
  required String input,
  required bool isNumber,
}) {
  if (isNumber) {
    return input.replaceAll(RegExp(r'[^0-9]'), '');
  } else {
    return input.replaceAll(RegExp(r'[^a-zA-Z]'), '');
  }
}

String updatePrefix({
  required String input,
  required String newPrefix,
  required bool isNumber,
}) {
  String numbers = input.replaceAll(RegExp(r'[^0-9]'), '');
  String letters = input.replaceAll(RegExp(r'[^a-zA-Z]'), '');

  if (isNumber) {
    // Input only contains numbers, add new prefix to the front of numbers
    return newPrefix + letters;
  } else {
    // Input contains letters, replace letters with new prefix
    return numbers + newPrefix;
  }
}
