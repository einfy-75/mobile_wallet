import 'package:flutter/material.dart';
import 'package:dubspay/constraints/color.dart';

class CardModel {
  String cardHolderName;
  String cardNumber;
  String expDate;
  String cvv;
  Gradient cardGradient;

  CardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.cvv,
    required this.expDate,
    required this.cardGradient
  });
}

List<CardModel> myCards = [
  CardModel(
    cardHolderName: "Mundie Kaweche",
    cardNumber: "****  ****  ****  1234",
    cvv: "**4",
    expDate: "12/21",
    cardGradient: myRadialGradient,
  ),
  CardModel(
    cardHolderName: "Innocencia Zuze",
    cardNumber: "****  ****  ****  4321",
    cvv: "**1",
    expDate: "01/22",
    cardGradient: myLinearGradient,
  ),
  CardModel(
    cardHolderName: "Bright Chimwanga",
    cardNumber: "****  ****  ****  4321",
    cvv: "**1",
    expDate: "01/22",
    cardGradient: mySweepGradient,

  ),
  CardModel(
    cardHolderName: "Oscar Steve",
    cardNumber: "****  ****  ****  4321",
    cvv: "**1",
    expDate: "01/22",
    cardGradient: myRadialGradient,
  ),
];
