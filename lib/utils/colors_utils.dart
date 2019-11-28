import 'package:flutter/material.dart';

class ColorUtils {
  Color primarycolor     = HexColor("f74269");
  Color greycolor        = HexColor("929794");
  Color searchgreycolor  = HexColor("e6e6e6");
  Color darkcolor        = HexColor("3D56F0");
  Color bluecolor        = HexColor("5468FF");
  Color violetcolor      = HexColor("5120AE");
  Color lightVioletColor = HexColor("7085C3");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}