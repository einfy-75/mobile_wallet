import 'package:debit_credit_card_widget/debit_credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u_credit_card/u_credit_card.dart';


class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddCardManually();
  }
}

class AddCardManually extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SlideInDown(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('New Card',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Oregon'
          ),),
          actions: [IconButton(color: Colors.black,onPressed: (){}, icon: const Icon(Iconsax.scan))],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: () {
              Navigator.pop(context); // Pop the screen when the back button is pressed
            },
          ),
        ),
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                CreditCardWidget(
                  height: 180,
                  width: 350,

                  backgroundImage: 'assets/placeholder/background.jpg',
                  chipColor: Colors.orangeAccent,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true, onCreditCardWidgetChange: (CreditCardBrand ) {  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          themeColor: Colors.blue,
                          cardNumberDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                          ),
                          expiryDateDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Card Holder',
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ), backgroundColor: const Color(0xff070101),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: const Text(
                              'Validate',
                              style: TextStyle(

                                color: Colors.lightGreenAccent,
                                fontFamily: 'Oregon',
                                fontSize: 14,
                                package: 'flutter_credit_card',
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('valid!');
                            } else {
                              print('invalid!');
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}