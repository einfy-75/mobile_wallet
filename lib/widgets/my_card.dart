import 'package:flutter/material.dart';
// import 'package:dubspay/constraints/text.dart';
import 'package:dubspay/data/cardData.dart';
import 'package:u_credit_card/u_credit_card.dart';

class MyCard extends StatelessWidget {
  final CardModel card;
  const MyCard({super.key, required this.card});
  @override
  Widget build(BuildContext context) {
    return CreditCardUi(
      cardHolderFullName: card.cardHolderName,
      cardNumber: card.cardNumber,
      validThru: card.expDate,
      doesSupportNfc: true,
      // cardBrand: CardBrand.visa,
      cardType: CardType.debit,
      topLeftColor: Colors.blue,
      bottomRightColor: Colors.blueGrey,
      validFrom: '12/23',





    );
  }
}
