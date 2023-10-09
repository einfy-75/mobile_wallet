import 'package:dubspay/config/config.dart';
import 'package:dubspay/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../model/spending.dart';
import 'package:dubspay/widgets/chart.dart';
import 'package:dubspay/widgets/spending_item_widget.dart';

class StaticsScreen extends StatefulWidget {
  const StaticsScreen({super.key});

  @override
  State<StaticsScreen> createState() => _StaticsScreenState();
}

class _StaticsScreenState extends State<StaticsScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  late AnimationController _animationController;

  static List<String> tabItems = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  final Color selectedTabColor = Colors.green;
  final Color unselectedTabColor = Colors.grey;

  static List<Spending> spendingItems = [
    Spending("Entertainment", 1442.1, 0.44, Colors.cyanAccent),
    Spending("Households", 689.12, 0.19, Colors.orange),
    Spending("Taxes", 628.98, 0.19, Colors.yellowAccent),
    Spending("Food", 310.19, 0.12, Colors.pinkAccent),
  ];

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    tabController = TabController(
      initialIndex: 0,
      length: tabItems.length,
      vsync: this,
    );

    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdf9f9),
        body: DefaultTabController(
      length: tabItems.length,
      child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.all(mediumDistance),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: largeDistance),
                    child: Text(
                      'OverView',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24,
                              fontWeight: FontWeight.w500,
                          fontFamily: 'Oregon'),
                    ),
                  )),

            ],
          ),
        ),
        const SizedBox(
          height: mediumDistance,
        ),
        Expanded(
            child: NestedScrollView(
                scrollDirection: Axis.vertical,
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverToBoxAdapter(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TabBar(
                            controller: tabController,
                            isScrollable: true,
                            indicatorColor: Colors.transparent,
                            tabs: tabItems
                                .map((e) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedDefaultTextStyle(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          style: TextStyle(
                                            fontFamily: 'OCR',
                                              fontWeight:
                                                  (tabController.index ==
                                                          tabItems.indexOf(e))
                                                      ? FontWeight.w900
                                                      : FontWeight.w500,
                                              fontSize: (tabController.index ==
                                                      tabItems.indexOf(e))
                                                  ? 24
                                                  : 20,
                                              color: (tabController.index ==
                                                      tabItems.indexOf(e))
                                                  ? Colors.green
                                                  : Colors.black),
                                          child: Text(
                                            e,
                                          ),
                                        ),
                                      ],
                                    ))
                                .toList(),
                          ),
                          const SizedBox(
                            height: largeDistance,
                          ),
                          SizedBox(
                            height: 224,
                            child: TabBarView(
                                controller: tabController,
                                children: List.generate(
                                  tabItems.length,
                                  (index) => Hero(
                                      tag: 'chart $index',
                                      child: LineChartSample2(
                                        aspectRatio: 2,
                                      )),
                                )),
                          )
                        ],
                      ))
                    ],
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   height: 80,
                    //   margin: const EdgeInsets.symmetric(
                    //       horizontal: mediumDistance),
                    //   padding: const EdgeInsets.all(mediumDistance),
                    //   decoration: const BoxDecoration(
                    //       color: darkSurfaceColor,
                    //       borderRadius:
                    //           BorderRadius.all(Radius.circular(mediumRadius))),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       // const Row(
                    //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       //   children: [
                    //       //     Text(
                    //       //       'Monthly limit',
                    //       //       style: TextStyle(
                    //       //         color: Colors.white,
                    //       //           fontWeight: FontWeight.w500, fontSize: 16),
                    //       //     ),
                    //       //     Text.rich(
                    //       //       TextSpan(
                    //       //         text: '907.21',
                    //       //         style: TextStyle(
                    //       //           fontSize: 16,
                    //       //           color: Colors.white70,
                    //       //           fontWeight: FontWeight.w500,
                    //       //         ),
                    //       //         children: <TextSpan>[
                    //       //           TextSpan(
                    //       //             text: "/2'000.00",
                    //       //             style: TextStyle(
                    //       //               fontSize: 16,
                    //       //               color: Colors.grey,
                    //       //               fontWeight: FontWeight.w400,
                    //       //             ),
                    //       //           ),
                    //       //         ],
                    //       //       ),
                    //       //     ),
                    //       //   ],
                    //       // ),
                    //       // Stack(
                    //       //   children: [
                    //       //     Container(
                    //       //       height: 8,
                    //       //       decoration: const BoxDecoration(
                    //       //           borderRadius: BorderRadius.all(
                    //       //               Radius.circular(smallRadius)),
                    //       //           color: darkBackgroundColor),
                    //       //     ),
                    //       //     AnimatedBuilder(
                    //       //       animation: _animationController,
                    //       //       builder: (BuildContext context, Widget? child) {
                    //       //         return Container(
                    //       //           height: 8,
                    //       //           width: _animationController.value * 200,
                    //       //           decoration: BoxDecoration(
                    //       //               borderRadius: const BorderRadius.all(
                    //       //                   Radius.circular(smallRadius)),
                    //       //               gradient: LinearGradient(colors: [
                    //       //                 Colors.orangeAccent.withOpacity(0.8),
                    //       //                 Colors.orangeAccent,
                    //       //                 Colors.deepOrangeAccent,
                    //       //                 Colors.deepOrange
                    //       //               ])),
                    //       //         );
                    //       //       },
                    //       //     ),
                    //       //   ],
                    //       // )
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: mediumDistance,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: mediumDistance),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            padding: const EdgeInsets.all(mediumDistance),
                            margin: const EdgeInsets.only(right: smallDistance),
                            height: MediaQuery.of(context).size.width / 2 - 32,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(mediumRadius)),
                                color: darkSurfaceColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Income',
                                  style: TextStyle(
                                    fontFamily: 'Oregon',
                                    color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                const Expanded(child: SizedBox()),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    "13'099.00",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24,
                                        color: Colors.green),
                                  ),
                                ),
                                const SizedBox(
                                  height: smallDistance,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    "100% Goal",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          )),
                          Expanded(
                              child: Container(
                            padding: const EdgeInsets.all(mediumDistance),
                            margin: const EdgeInsets.only(left: smallDistance),
                            height: MediaQuery.of(context).size.width / 2 - 32,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(mediumRadius)),
                                color: darkSurfaceColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Spending',
                                      style: TextStyle(
                                        fontFamily: 'Oregon',
                                        color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Icon(
                                      Icons.account_balance,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                                const Expanded(child: SizedBox()),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    "14'006.00",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24,
                                        color: Colors.red),
                                  ),
                                ),
                                const SizedBox(
                                  height: smallDistance,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    "112% Goal",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediumDistance,
                            vertical: mediumDistance),
                        child: Text(
                          'Spending summary',
                          style: TextStyle(
                            fontFamily: 'OCR',
                              fontWeight: FontWeight.w500, fontSize: 16),
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: mediumDistance),
                        child: ListView.builder(
                            itemCount: spendingItems.length,
                            itemBuilder: (_, i) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: mediumDistance),
                                  decoration: BoxDecoration(
                                      color: darkSurfaceColor,
                                      borderRadius: (i == 0)
                                          ? const BorderRadius.only(
                                              topLeft:
                                                  Radius.circular(mediumRadius),
                                              topRight:
                                                  Radius.circular(mediumRadius))
                                          : (i == spendingItems.length - 1)
                                              ? const BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                      mediumRadius),
                                                  bottomRight: Radius.circular(
                                                      mediumRadius))
                                              : const BorderRadius.all(
                                                  Radius.circular(0),
                                                )),
                                  child: Column(
                                    children: [
                                      SpendingItemWidget(
                                          spending: spendingItems[i]),
                                      if (i != spendingItems.length - 1)
                                        Container(
                                          height: 1,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(1)),
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerRight,
                                                  end: Alignment.centerLeft,
                                                  colors: [
                                                    Colors.grey
                                                        .withOpacity(0.3),
                                                    Colors.grey
                                                        .withOpacity(0.6),
                                                    Colors.grey
                                                        .withOpacity(0.3),
                                                  ])),
                                        ),
                                    ],
                                  ),
                                )),
                      ),
                    ),
                    const SizedBox(
                      height: smallDistance,
                    )
                  ],
                ))),
      ])),

    ));
  }
}
