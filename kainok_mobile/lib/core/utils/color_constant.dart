import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray5001 = fromHex('#fbfbfb');
  static Color alertMsgContent = fromHex('#707276');

  static Color red500 = fromHex('#ef4444');

  static Color greenA700 = fromHex('#22c55e');

  static Color gray50001 = fromHex('#939394');

  static Color gray200 = fromHex('#e5e7eb');

  static Color yellow700 = fromHex('#fbbf24');

  static Color gray90004 = fromHex('#222222');

  static Color red600 = fromHex('#da3834');

  static Color lightBlue100 = fromHex('#a6e8ff');

  static Color black90019 = fromHex('#19050505');

  static Color whiteA70090 = fromHex('#90ffffff');

  static Color gray70002 = fromHex('#5d5f62');

  static Color gray50 = fromHex('#f8f8f8');

  static Color whiteA700Cc = fromHex('#ccffffff');

  static Color black900Dd = fromHex('#dd000000');

  static Color black900 = fromHex('#000000');

  static Color black90028 = fromHex('#28000000');

  static Color blueGray900 = fromHex('#343434');

  static Color black90026 = fromHex('#26000000');

  static Color gray600Dd = fromHex('#dd787878');

  static Color gray90002 = fromHex('#212121');

  static Color gray600 = fromHex('#7d7d7d');

  static Color gray700 = fromHex('#676767');

  static Color gray90003 = fromHex('#161616');

  static Color gray500 = fromHex('#939394');

  static Color blueGray400 = fromHex('#868686');

  static Color gray800 = fromHex('#494949');

  static Color black9008e = fromHex('#8e000000');

  static Color gray900 = fromHex('#20242f');
  static Color deepBlack = fromHex('#1D1F22');
  static Color boldLightGray = fromHex('#999B9F');

  static Color gray90001 = fromHex('#282828');

  static Color black9000c = fromHex('#0c000000');

  static Color gray300 = fromHex('#dddddd');

  static Color orange300 = fromHex('#e8ba41');

  static Color gray100 = fromHex('#f2f4f8');

  static Color black90054 = fromHex('#54000000');

  static Color black90099 = fromHex('#99000000');

  static Color whiteA70001 = fromHex('#fbfdff');

  static Color gray10001 = fromHex('#f6f6f6');

  static Color indigo700 = fromHex('#2c2aaa');

  static Color blueGray40001 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color whiteA7005a = fromHex('#5affffff');

  static Color gray70001 = fromHex('#666666');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
