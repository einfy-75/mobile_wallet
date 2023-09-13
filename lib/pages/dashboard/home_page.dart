import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // Import the iconsax package if needed
import 'dart:async';
// import 'package:dubspay/pages/dashboard/notification.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:dubspay/pages/cards/cardsWidget.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String userName = "Mundie"; // Replace with the user's actual name
  bool showWelcomeMessage = true;
  late Timer messageTimer;
  var _currentIndex = 0;

  final List<dynamic> _transactions = [
    ['Amazon', 'https://img.icons8.com/color/2x/amazon.png', '6:25pm', '8000.90'],
    ['Cash from ATM', 'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png', '5:50pm', '\$200.00'],
    ['Netflix', 'https://img.icons8.com/color-glass/2x/netflix.png', '2:22pm', '13000.99'],
    ['Apple Store', 'https://img.icons8.com/color/2x/mac-os--v2.gif', '6:25pm', '1204.99'],
    ['Cash from ATM', 'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png', '5:50pm', '\$200.00'],
    ['Netflix', 'https://img.icons8.com/color-glass/2x/netflix.png', '2:22pm', '10003.99']
  ];
  final List<dynamic> _services = [
    ['Transfer', Iconsax.export_1, Colors.blue],
    ['Request', Iconsax.import, Colors.pink],
    ['Pay Bill', Iconsax.wallet_3, Colors.orange],
    ['Split', Iconsax.coin_1, Colors.green],
    ['More', Iconsax.more, Colors.green],
  ];

  @override
  void initState() {
    super.initState();
    // Start a timer to hide the message after 3 seconds
    messageTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        showWelcomeMessage = false;
      });
    });
  }

  @override
  void dispose() {
    messageTimer.cancel(); // Cancel the timer when disposing the widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            pinned: false,
            snap: false,
            expandedHeight: 60,
              actions: [
                IconButton(
                  icon: Icon(Iconsax.notification, color: Colors.grey.shade700),
                  onPressed: () {},
                ),
                const SizedBox(width: 20,),
                IconButton(
                  icon: Icon(Iconsax.more, color: Colors.grey.shade700),
                  onPressed: () {},
                ),
              ],
            flexibleSpace: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: AnimatedOpacity(
                    opacity: showWelcomeMessage ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1000),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome back!',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          userName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ), Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0)
                    ,
                    child: Image.asset(
                      'assets/logo/naPaya.png',
                      width: 30.0,
                      height: 30.0,
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //       left: 0.0,
                //       top: 10.0,
                //       right: 15.0,
                //
                //     ),
                //     child: NotificationIconButton(
                //       onPressed: () {
                //         // Handle notification button press
                //         // You can add your notification logic here
                //       },
                //     )
                //   ),
                // ),
              ],
            )
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                if (index == 0) {
                  // Display the credit card carousel as the first item
                  return CardWidgetpage();
                } else {
                  // Display other list items
                  return const Row(
                    children: [

                    ],
                  );
                }
              },
              childCount: 2, // Include one extra for the carousel
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  height: 115,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _services.length,
                    itemBuilder: (context, index) {
                      return FadeInDown(
                        duration: Duration(milliseconds: (index + 1) * 100),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: GestureDetector(
                            onTap: () {
                              if (_services[index][0] == 'Transfer') {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage()));
                              }
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade900,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Icon(_services[index][1], color: Colors.white, size: 25,),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(_services[index][0], style: TextStyle(color: Colors.grey.shade800, fontSize: 12),),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ])
          ),

          SliverFillRemaining(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              FadeInDown(
                duration:const Duration(milliseconds: 500),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Today', style: TextStyle(color: Colors.grey.shade800, fontSize: 14, fontWeight: FontWeight.w600),),
                      const SizedBox(width: 10,),
                      const Text(' 1,840.00', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700,)),
                    ]
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _transactions.length,
                  itemBuilder: (context, index) {
                    return FadeInDown(
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.network(_transactions[index][1], width: 50, height: 50,),
                                const SizedBox(width: 15,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_transactions[index][0], style: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.w500, fontSize: 14),),
                                    const SizedBox(height: 5,),
                                    Text(_transactions[index][2], style: TextStyle(color: Colors.grey.shade500, fontSize: 12),),
                                  ],
                                ),
                              ],
                            ),
                            Text(_transactions[index][3], style: TextStyle(color: Colors.grey.shade800, fontSize: 16, fontWeight: FontWeight.w700),),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
        ],
      ),

      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.transparent,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.home),
            title: const Text("Home"),
            unselectedColor: Colors.grey.shade700,
            selectedColor: Colors.black,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.activity),
            title: const Text("Statistics"),
            unselectedColor: Colors.grey.shade700,
            selectedColor: Colors.black,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.card),
            title: const Text("Cards"),
            unselectedColor: Colors.grey.shade700,
            selectedColor: Colors.black,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.user),
            title: const Text("Account"),
            unselectedColor: Colors.grey.shade700,
            selectedColor: Colors.black,
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(60.0),
        child: FloatingActionButton(

          onPressed: () {
            // Add your action for the floating scanner button here.
          },

          child: const Icon(Iconsax.scan,color: Colors.lightGreenAccent,),

          backgroundColor: Colors.black, // Change the color as desired.
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final double radius;

  const ProfileAvatar({
    this.imageUrl,
    this.radius = 30.0, // Default radius size if not specified
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: imageUrl != null
          ? AssetImage(imageUrl!)
          : const AssetImage('assets/placeholder/proholder.png'), // Replace with your placeholder image
    );
  }
}


// Widget _buildPage(int index) {
//   switch (index) {
//     case 0:
//       return HomeScreen();
//     case 1:
//       return StatisticsScreen();
//     case 2:
//       return CardsScreen();
//     case 3:
//       return AccountScreen();
//     default:
//       return HomeScreen();
//   }
// }
// }