import 'package:flutter/material.dart';

class WeaponCategory {
  static const int sword = 0;
  static const int claymore = 1;
  static const int polearms = 2;
  static const int catalysts = 4;
  static const int bows = 3;
}

class WeaponRarity {
  static const int one = 1;
  static const int two = 2;
  static const int three = 3;
  static const int four = 4;
  static const int five = 5;
}

class RarityColors {
  static const Color one = Colors.white;
  static const Color two = Colors.white;
  static const Color three = Color.fromRGBO(109, 141, 167, 1);
  static const Color four = Color.fromRGBO(155, 132, 179, 1);
  static const Color five = Color.fromRGBO(216, 162, 80, 1);
}
