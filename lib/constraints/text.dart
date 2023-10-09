import 'package:flutter/material.dart';
import 'package:dubspay/constraints/color.dart';

class ApptextStyle {
  static const TextStyle MY_CARD_TITLE =
  TextStyle(color: kThirdColor, fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'Oregon');

  static const TextStyle MY_CARD_SUBTITLE =
  TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18,fontFamily: 'OCR');

  static const TextStyle BODY_TEXT = TextStyle(
      color: kPrimaryColor, fontWeight: FontWeight.w700, fontSize: 20, fontFamily: 'Oregon');

  static const TextStyle LISTTILE_TITLE = TextStyle(
    color: kPrimaryColor,
    fontSize: 20,
    fontFamily: 'OCR'
  );

  static const TextStyle LISTTILE_SUB_TITLE = TextStyle(
    color: Colors.grey,
    fontSize: 15,
  );
}
