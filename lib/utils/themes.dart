import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../services/navigation.dart';

//ini belum disesuaikan sama yang baru
final ColorScheme lightTheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF006B53),
  brightness: Brightness.light,
  primary: const Color(0xFF006B53),
  primaryContainer: const Color(0xFF77F9D2),
  onPrimaryContainer: const Color(0xFF012018),
  onPrimary: const Color(0xFFFFFFFF),
  secondary: const Color(0xFF4B635A),
  secondaryContainer: const Color(0xFFCEE9DD),
  onSecondaryContainer: const Color(0xFF072019),
  onSecondary: const Color(0xFFFFFFFF),
  tertiary: const Color(0xFF416376),
  onTertiary: const Color(0xFFFFFFFF),
  tertiaryContainer: const Color(0xFFC4E8FF),
  onTertiaryContainer: const Color(0xFF001E2C),
  onSurface: const Color(0xFF191C1B),
  surface: const Color(0xFFFBFDFA),
  background: const Color(0xFFFBFBFB),
  onBackground: const Color(0xFF333333),
  error: const Color(0xFFBA1B1B),
  onErrorContainer: const Color(0xFF410001),
  onError: const Color(0xFFFFFFFF),
  errorContainer: const Color(0xFFFFDAD4),
  surfaceVariant: const Color(0xFFF0F2FF),
  onSurfaceVariant: const Color(0xFF3F4945),
  outline: const Color(0xFF6F7974),
  inversePrimary: const Color(0xFFF6F7FB),
);

final ColorScheme darkTheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF58DCB7),
  brightness: Brightness.dark,
  primary: const Color(0xFF58DCB7),
  primaryContainer: const Color(0xFF00513E),
  onPrimaryContainer: const Color(0xFF77F9D2),
  onPrimary: const Color(0xFF00382A),
  secondary: const Color(0xFFB2CCC1),
  secondaryContainer: const Color(0xFF344B43),
  onSecondaryContainer: const Color(0xFFCEE9DD),
  onSecondary: const Color(0xFF09141A),
  tertiary: const Color(0xFFA8CCE2),
  onTertiary: const Color(0xFF0D3446),
  tertiaryContainer: const Color(0xFF284B5E),
  onTertiaryContainer: const Color(0xFFC4E8FF),
  onSurface: const Color(0xFFE1E3E0),
  surface: const Color(0xFF0E191F),
  background: const Color(0xFF09141A),
  onBackground: Colors.white,
  error: const Color(0xFFFF8291),
  onErrorContainer: const Color(0xFFFFDAD4),
  onError: const Color(0xFF680003),
  errorContainer: const Color(0xFF930006),
  surfaceVariant: const Color(0xFF565D62),
  onSurfaceVariant: const Color(0xFFBFC9C3),
  outline: const Color(0xFF89938E),
  inversePrimary: const Color(0xFF222B31),
  inverseSurface: const Color(0xFF2e373c),
);

const Color background = Color(0xFFFBFBFB);
List<Color> gradientFincy = const [
  Color(0xFF62CDCB),
  Color(0xFF4599DB),
];

List<Color> gradientBlue = const [
  Color(0xFFABFFFD),
  Color(0xFFAADAFF),
];
List<Color> goldenTwo = const [
  Color(0xFF94783E),
  Color(0xFFF3EDA6),
  Color(0xFFF8FAE5),
  Color(0xFFFFE2BE),
  Color(0xFFD5BE88),
  Color(0xFFF8FAE5),
  Color(0xFFD5BE88)
];
List<Color> isFill = [
  const Color(0xFF62CDCB).withOpacity(0.5),
  const Color(0xFF4599DB).withOpacity(0.5),
];
List<Color> isFillGradient = [
  const Color(0xFF62CDCB).withOpacity(0.01),
  const Color(0xFF4599DB).withOpacity(0.01),
];
List<Color> aintFill = [
  Colors.transparent,
  Colors.transparent,
];
const Color blueFinc = Color(0xFF449ADA);
const Color greenFinc = Color(0xFF62CECE);
const Color selectedColor = Color(0xFF2E373C);
const Color bluebg = Color(0x1A52B0D5);
const Color inputbg = Color(0x0DFFFFFF);
List<Color> swapColor = const [
  Color(0xFFFFD698),
  Color(0xFFFFD089),
  Color(0xFFD67F2F),
];
List<Color> remitColor = const [
  Color(0xFFDDBBFF),
  Color(0xFF8D17AA),
];
List<Color> topUpColor = const [
  Color(0xFFA9A7FB),
  Color(0xFF222C8D),
];
List<Color> topUpColorOpacity = [
  const Color(0xFFA9A7FB).withOpacity(0.2),
  const Color(0xFF222C8D).withOpacity(0.2),
];
List<Color> withDrawColor = const [
  Color(0xFFFFADAD),
  Color(0xFFB02525),
];

List<Color> withDrawColorOpacity = [
  const Color(0xFFFFADAD).withOpacity(0.2),
  const Color(0xFFB02525).withOpacity(0.2),
];
List<Color> scanColor = const [
  Color(0xFFA4FAF5),
  Color(0xFF0B6572),
];
List<Color> myQRColor = const [
  Color(0xFFFFF7B1),
  Color(0xFF937715),
];
List<Color> transferColor = const [
  Color(0xFFFFC2F9),
  Color(0xFFB61F9E),
];

List<Color> transferColorOpacity = [
  const Color(0xFFFFC2F9).withOpacity(0.2),
  const Color(0xFFB61F9E).withOpacity(0.2),
];
List<Color> receiveColor = const [
  Color(0xFF9FFF8F),
  Color(0xFF0D5E28),
];
List<Color> receiveColorOpacity = [
  const Color(0xFF9FFF8F).withOpacity(0.2),
  const Color(0xFF0D5E28).withOpacity(0.2),
];
List<Color> overlay = const [
  Color(0xFF5844EC),
  Color(0xFF116783),
];
List<Color> withDraw = const [
  Color(0xFF06605E),
  Color(0xFF384DB2),
];

Color greySweet = const Color.fromRGBO(255, 255, 255, 0.1);
List<Color> greyed = const [cD0D0D0, cD0D0D0];

const Color textBlack = Color(0xFF3D3D3D);
const Color textGrey = Color(0xFFCBCBCB);
const Color textRegular = Color(0xFF7C7C7C);
const Color textBlue = Color(0xFFA1E5FF);
const Color error = Color(0xFFBA1B1B);
const Color cFD6577 = Color(0xFFFD6577);
const Color cA4A4A4 = Color(0xFFA4A4A4);
const Color c535353 = Color(0xFF535353);
const Color c515151 = Color(0xFF515151);
const Color c525252 = Color(0xFF525252);
const Color cD9D9D9 = Color(0xFFD9D9D9);
const Color cF5F5F5 = Color(0xFFF5F5F5);
const Color c4F4F4F = Color(0xFF4F4F4F);
const Color c858585 = Color(0xFF858585);
const Color cBDBDBD = Color(0xFFBDBDBD);
const Color cF6F7FB = Color(0xFFF6F7FB);
const Color cD6D6D6 = Color(0xFFc6D6D6);
const Color c664FFF = Color(0xFF664FFF);
const Color cF1F1F1 = Color(0xFFF1F1F1);
const Color c3D0BA6 = Color(0xFF3D0BA6);
const Color cF9FBFF = Color(0xFFF9FBFF);
const Color cE7E7E7 = Color(0xFFE7E7E7);
const Color cADADAD = Color(0xFFADADAD);
const Color cFBFBFB = Color(0xFFFBFBFB);
const Color c9B9B9B = Color(0xFF9B9B9B);
const Color cF9FAFB = Color(0xFFF9FAFB);
const Color c323233 = Color(0xFF323233);
const Color c99A0BE = Color(0xFF99A0BE);
const Color c00135C = Color(0xFF00135C);
const Color c333333 = Color(0xFF333333);
const Color cA6A6A6 = Color(0xFFA6A6A6);
const Color cB3B9CF = Color(0xFFB3B9CF);
const Color c1B4042 = Color(0xFF1B4042);
const Color c8C8C8C = Color(0xFF8C8C8C);
const Color cDADADA = Color(0xFFDADADA);
const Color cC5C5C5 = Color(0xFFC5C5C5);
const Color c4E4E4E = Color(0xFF4E4E4E);
const Color cF2994A = Color(0xFFF2994A);
const Color c828282 = Color(0xFF828282);
const Color cF6FBFD = Color(0xFFF6FBFD);
const Color c9A9A9A = Color(0xFF9A9A9A);
const Color cB3B3B3 = Color(0xFFB3B3B3);
const Color c1E1E1E = Color(0xFF1E1E1E);
const Color c888888 = Color(0xFF888888);
const Color cB2FFFE = Color(0xFFB2FFFE);
const Color cA0AEC0 = Color(0xFFA0AEC0);
const Color c62CDCC = Color(0xFF62CDCC);
const Color cEEEEEE = Color(0xFFEEEEEE);
const Color cF8F8F8 = Color(0xFFF8F8F8);
const Color cF5F7FF = Color(0xFFF5F7FF);
const Color c7B82C0 = Color(0xFF7B82C0);
const Color c7A7A7A = Color(0xFF7A7A7A);
const Color cA3A3A3 = Color(0xFFA3A3A3);
const Color c696969 = Color(0xFF696969);
const Color c52B0D5 = Color(0xFF52B0D5);
const Color cD09FF1 = Color(0xFFD09FF1);
const Color cF24357 = Color(0xFFF24357);
const Color cFF9595 = Color(0xFFFF9595);
const Color cDC3836 = Color(0xFFDC3836);
const Color cEAF4F7 = Color(0xFFEAF4F7);
const Color c3D3D3D = Color(0xFF3D3D3D);
const Color c303030 = Color(0xFF303030);
const Color cE9E9E9 = Color(0xFFE9E9E9);
const Color c9E9E9E = Color(0xFF9E9E9E);
const Color cB0B0B0 = Color(0xFFB0B0B0);
const Color cEFEFEF = Color(0xFFEFEFEF);
const Color cA2A4A9 = Color(0xFFA2A4A9);
const Color c189BD3 = Color(0xFF189BD3);
const Color c8BFFFF = Color(0xFF8BFFFF);
const Color c999999 = Color(0xFF999999);
const Color c9F9F9F = Color(0xFF9F9F9F);
const Color c3E3E3E = Color(0xFF3E3E3E);
const Color c777777 = Color(0xFF777777);
const Color c88FFFD = Color(0xFF88FFFD);
const Color c8DC8FF = Color(0xFF8DC8FF);
const Color c6F73CC = Color(0xFF6F73CC);
const Color c434343 = Color(0xFF434343);
const Color cD0D0D0 = Color(0xFFD0D0D0);
const Color cE6B4FF = Color(0xFFE6B4FF);
const Color c1F9E9C = Color(0xFF1F9E9C);
const Color cFF6F6F = Color(0xFFFF6F6F);
const Color c1A232A = Color(0xFF1A232A);
const Color c7AD1D0 = Color(0xFF7AD1D0);
const Color cFF9A9A = Color(0xFFFF9A9A);
const Color c62CDCB = Color(0xFF62CDCB);
const Color cF14848 = Color(0xFFF14848);
const Color cFF8A8A = Color(0xFFFF8A8A);
const Color c141F24 = Color(0xFF141F24);
const Color c0A141B = Color(0xFF0A141B);
const Color c7CC7FF = Color(0xFF7CC7FF);
const Color c1C2429 = Color(0xFF1C2429);
const Color c171E23 = Color(0xFF171E23);
const Color c222B31 = Color(0xFF222B31);
const Color cFF8686 = Color(0xFFFF8686);

final service = GetIt.I<NavigationServiceMain>();

final themes = Theme.of(service.navigatorKey.currentState!.context);

class CustomColor {
  static Color primary =
      Theme.of(service.navigatorKey.currentState!.context).colorScheme.primary;
  static Color onPrimary = Theme.of(service.navigatorKey.currentState!.context)
      .colorScheme
      .onPrimary;
  static Color primaryContainer = themes.colorScheme.primaryContainer;
  static Color onPrimaryContainer = themes.colorScheme.onPrimaryContainer;

  static Color background = themes.colorScheme.background;
  static Color onBackground = themes.colorScheme.onBackground;

  static Color secondary = themes.colorScheme.secondary;
  static Color onSecondary = themes.colorScheme.onSecondary;
  static Color secondaryContainer = themes.colorScheme.secondaryContainer;
  static Color onSecondaryContainer = themes.colorScheme.onSecondaryContainer;

  static Color tertiary = themes.colorScheme.tertiary;
  static Color onTertiary = themes.colorScheme.onTertiary;
  static Color tertiaryContainer = themes.colorScheme.tertiaryContainer;
  static Color onTertiaryContainer = themes.colorScheme.onTertiaryContainer;

  static Color error = themes.colorScheme.error;
  static Color errorContainer = themes.colorScheme.errorContainer;
  static Color onErrorContainer = themes.colorScheme.onErrorContainer;
  static Color onError = themes.colorScheme.onError;

  static Color surface = themes.colorScheme.surface;
  static Color onSurface = themes.colorScheme.onSurface;
  static Color surfaceVariant = themes.colorScheme.onSurfaceVariant;
  static Color onSurfaceVariant = themes.colorScheme.onSurfaceVariant;

  static Color outline = themes.colorScheme.outline;

  static Color inverseOnSurface = themes.colorScheme.onInverseSurface;
  static Color inverseSurface = themes.colorScheme.inverseSurface;
  static Color inversePrimary = themes.colorScheme.inversePrimary;

  static Color surface1 = primary.withOpacity(0.05);
  static Color surface2 = primary.withOpacity(0.08);
  static Color surface3 = primary.withOpacity(0.11);
  static Color surface4 = primary.withOpacity(0.12);
  static Color surface5 = primary.withOpacity(0.14);

  static Color shimmerBase = const Color(0xFFEEEEEE);
  static Color shimmerLight = const Color(0xFFEEEEEE).withOpacity(0.05);
}
