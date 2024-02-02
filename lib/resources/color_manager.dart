import 'package:flutter/material.dart';

class ColorManager {
  //* App colors
  static Color primary = HexColor.fromHex("#15616d");
  static Color secondary = HexColor.fromHex("#ff7d00");
  static Color lightPrimary = HexColor.fromHex("#001524");
  static Color darkPrimary = HexColor.fromHex("#001524");
  static Color darkSecondary = HexColor.fromHex("#78290f");
  static Color background = HexColor.fromHex("#ffecd1");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");

  //* App system colors
  // static Color darkPrimary = HexColor.fromHex("#001524");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black = HexColor.fromHex("#000000");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
