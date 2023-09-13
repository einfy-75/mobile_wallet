// ignore: file_names
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<Map<String, String>> creditCardData = [
  {
    'cardNumber': '**** **** **** 1234',
    'cardHolderName': 'Brightson Chimwanga',
    'expiryDate': '12/25',
  },
  {
    'cardNumber': '**** **** **** 5678',
    'cardHolderName': 'Steve Kamangira',
    'expiryDate': '10/24',
  },
  {
    'cardNumber': '**** **** **** 4533',
    'cardHolderName': 'Mundie Kaweche',
    'expiryDate': '12/24'
  },
  {
    'cardNumber': '**** **** **** 4533',
    'cardHolderName': 'Patrick Kaweche',
    'expiryDate': '12/24'
  }
  // Add more credit card data here...
];


class CardWidgetpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration:const BoxDecoration(
        color: Color(0xff979c9e),
        borderRadius:  BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        )
      ),
      child: CarouselSlider.builder(
        itemCount: creditCardData.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return CreditCardWidget(
            cardNumber: creditCardData[index]['cardNumber'],
            cardHolderName: creditCardData[index]['cardHolderName'],
            expiryDate: creditCardData[index]['expiryDate'],
          );
        },

        options: CarouselOptions(
          height: 200.0,
          animateToClosest: true,
          aspectRatio: 1,
          enlargeCenterPage: true,
          autoPlay: false,
          // autoPlayInterval: const Duration(seconds: 3),
        ),
      ),
    );
  }
}
class CreditCardWidget extends StatelessWidget {
  final String? cardNumber;
  final String? cardHolderName;
  final String? expiryDate;

  const CreditCardWidget({
    this.cardNumber,
    this.cardHolderName,
    this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.0,
      height:50.0,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(
        boxShadow:const [ BoxShadow(
          blurRadius: 2,
          color: Colors.black38,
          offset: Offset(2, 3)
        )],
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Card Number',
              style: TextStyle(color: Colors.black38),
            ),
            Text(
              cardNumber ?? '', // Provide a default value if cardNumber is null
              style: const TextStyle(color: Colors.white, fontSize: 10.0),
            ),
            const SizedBox(height: 1.0),
            const Text(
              'Card Holder',
              style:  TextStyle(color: Colors.black38),
            ),
            Text(
              cardHolderName ?? '', // Provide a default value if cardHolderName is null
              style: const TextStyle(color: Colors.white, fontSize: 10.0),
            ),
            const SizedBox(height: 3.0),
            const Text(
              'Expiry Date',
              style: TextStyle(color: Colors.black38),
            ),
            Text(
              expiryDate ?? '', // Provide a default value if expiryDate is null
              style: const TextStyle(color: Colors.white, fontSize: 10.0),
            ),
          ],
        ),
      ),
    );
  }
}
