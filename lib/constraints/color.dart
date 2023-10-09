import 'package:flutter/material.dart';


const kPrimaryColor = Color(0xff07a32e);
const kSecondaryColor = Color(0xff6d6d6d);
const kThirdColor = Color(0xff34e7c1);
const kBackgroundColor = Color(0xfffff9f4);


SweepGradient mySweepGradient = const SweepGradient(
  colors: [
    kPrimaryColor,
    kSecondaryColor,
  ],
  center: Alignment.center,
  startAngle: 0.0,
  endAngle: 2 * 3.14159265359, // This represents 360 degrees in radians
);
LinearGradient myLinearGradient = const LinearGradient(
  colors: [
    kThirdColor,
    kSecondaryColor,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

RadialGradient myRadialGradient = const RadialGradient(
  colors: [
    kPrimaryColor,
    kSecondaryColor,
  ],
  center: Alignment.center,
  radius: 1.0,
);







