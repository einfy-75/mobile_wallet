import 'package:flutter/material.dart';
import 'package:dubspay/constraints/color.dart';
import 'package:dubspay/data/cardData.dart';
import 'package:dubspay/constraints/text.dart';
import 'package:dubspay/widgets/my_card.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dubspay/actions/addcard.dart';


class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  // const CardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "My Cards",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Oregon",
            color: Colors.black,
          ),
        ),

        actions: [
          IconButton(
              icon: const Icon(
                Iconsax.notification,
                color: Colors.black,
                size: 27,
              ),
              onPressed: () {})
        ],
      ),
      body: Container(
        color: Colors.white60,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInDown(

                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: myCards.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemBuilder: (context, index) {
                        return MyCard(
                          card: myCards[index],
                        );
                      }),
                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(2.0),
        child: FloatingActionButton(

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddCard()),
            );
            // Add your action for the floating scanner button here.
          },

          backgroundColor: Colors.black,

          child: const Icon(Iconsax.add,color: Colors.lightGreenAccent,), // Change the color as desired.
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

