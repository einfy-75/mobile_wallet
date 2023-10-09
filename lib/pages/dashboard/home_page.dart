import 'package:flutter/material.dart';
import 'dart:async';
import 'package:iconsax/iconsax.dart';
import 'package:animate_do/animate_do.dart';
import 'package:dubspay/widgets/my_card.dart';
import 'package:dubspay/data/cardData.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String userName = "Mundie"; // Replace with the user's actual name
  bool showWelcomeMessage = true;
  late Timer messageTimer;
  int balance = 23000;

  final PageController _pageController = PageController();

  final List<dynamic> _transactions = [
    ['Amazon', 'https://img.icons8.com/color/2x/amazon.png', '6:25pm', '8000.90'],
    ['Cash from ATM', 'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png', '5:50pm', '\$200.00'],
    ['Netflix', 'https://img.icons8.com/color-glass/2x/netflix.png', '2:22pm', '13000.99'],
    ['Apple Store', 'https://img.icons8.com/color/2x/mac-os--v2.gif', '6:25pm', '1204.99'],
    ['Cash from ATM', 'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png', '5:50pm', '\$200.00'],
    ['Netflix', 'https://img.icons8.com/color-glass/2x/netflix.png', '2:22pm', '10003.99']
  ];
  int selectedIndex = 0;
  final List<dynamic> _services = [
    ['Transfer', Iconsax.export_1, Colors.blue],
    ['Request', Iconsax.import, Colors.pink],
    ['Pay Bill', Iconsax.wallet_3, Colors.orange],
    // ['Split', Iconsax.coin_1, Colors.green],
    ['More', Iconsax.menu, Colors.green],
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
    messageTimer.cancel();
    _pageController.dispose(); // Cancel the timer when disposing the widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xB2F8FAEA),
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
              // backgroundColor: Color(0xB2D0D7A6),
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: const Color(0xB2D0D7A6),
            floating: true,
            pinned: false,
            snap: false,
            expandedHeight: 60,
              actions: [
                IconButton(
                  icon: const Icon(Iconsax.notification, color: Colors.black87),
                  onPressed: () {},
                ),
                const SizedBox(width: 20,),
                IconButton(
                  icon: const Icon(Iconsax.more, color: Colors.black87),
                  onPressed: () {},
                ),
              ],
            flexibleSpace: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: AnimatedOpacity(
                    opacity: showWelcomeMessage ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 6000),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome!',
                          style: TextStyle(
                            fontFamily: 'ShortBaby',
                            color: Colors.black45,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          userName,
                          style: const TextStyle(
                            fontFamily: 'Oregon',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ), const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(15.0)
                    ,
                    child: Text(
                      'finmal',
                      style: TextStyle(
                        fontFamily: 'Freedom',
                        color: Colors.black,
                        fontSize: 23.0
                      ),
                    )
                    // child: Image.asset(
                    //   'assets/logo/img.png',
                    //   width: 100,
                    //   height: 100,
                    // ),
                  ),
                )
              ],
            )
          ),

      // SliverToBoxAdapter(
      //   child: SlideInLeft(child:
      //   const Padding(
      //     padding: const EdgeInsets.all(18.0),
      //     child: Row(
      //       children: [
      //         Text('Total Balance',
      //         style: TextStyle(
      //           fontFamily: 'AgencyFB',
      //           fontSize: 20,
      //           color: Colors.black,
      //           fontWeight: FontWeight.normal
      //
      //         ),),
      //
      //         Text(': MK 200,000', style:
      //           TextStyle(fontFamily: 'OCR', fontSize: 20, color: Colors.green),)
      //       ],
      //     ),
      //   )),
      // ),

      SliverToBoxAdapter(
        child: Column(
          children: [
            Container(
              height:200,
              margin: EdgeInsets.all(10),
              child: ListView.separated(
                physics: const ClampingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: myCards.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                itemBuilder: (context, index) {
                  return MyCard(
                    card: myCards[index],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: myCards.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.green,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
            ),
          ],
        ),
      ),
          SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 5,),
                Container(
                  margin: const EdgeInsets.all(25),

                  decoration: BoxDecoration(
                      color: Color(0xFF1D1D1D),
                    borderRadius: BorderRadius.circular(25.0)
                  ),
                  height: 150.0,
                  width: double.infinity,
                  child:Row(
                    children: _services.map((service) {
                    return InkWell(
                        highlightColor: Colors.white,

                        onTap: () {
                          // Add your click handlin logic here
                          print('Icon clicked: ${service[0]}');
                        },
                        child: FadeInDown(
                          duration: Duration(milliseconds: (_services.indexOf(service) + 1) * 100),
                          child: Padding(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.15,
                                  height: MediaQuery.of(context).size.width * 0.15,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade800,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Icon(service[1], color: Colors.lightGreenAccent, size: MediaQuery.of(context).size.width * 0.06,),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text(service[0], style: TextStyle(
                                  fontFamily: 'Oregon',
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.03),),
                              ],
                            ),
                          ),
                        ),
                      );


                    }).toList(),
                  )

                ),
              ])
          ),

          SliverFillRemaining(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          decoration: const BoxDecoration(
            color: Colors.white,
            // boxShadow: [BoxShadow(
            //   blurRadius: 10,
            //   spreadRadius: 5,
            //   color: Colors.black38,
            //
            //
            // )]

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0)
            )
          ),
          child: Column(
            children: [
              FadeInDown(
                duration:const Duration(milliseconds: 500),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent Transactions', style: TextStyle(
                          color: Colors.grey.shade800,
                          fontFamily: 'Oregon',
                          fontSize: 20,
                          fontWeight: FontWeight.w600),),
                      const SizedBox(width: 10,),
                      const Text(' 1,840.00', style: TextStyle(color: Colors.black, fontFamily:'OCR',fontSize: 16, fontWeight: FontWeight.w700,)),
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
                          color: const Color(0xFFF1EEEE),
                          borderRadius: BorderRadius.circular(15),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.shade200,
                          //     blurRadius: 5,
                          //     spreadRadius: 1,
                          //     offset: const Offset(0, 6),
                          //   ),
                          // ],
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(2.0),
        child: FloatingActionButton(

          onPressed: () {
            // Add your action for the floating scanner button here.
          },

          backgroundColor: Colors.black,

          child: const Icon(Iconsax.scan,color: Colors.lightGreenAccent,), // Change the color as desired.
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


    );
  }
}

