//
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
//
// List<dynamic> services = [
//   ['Transfer', Iconsax.export_1, Colors.blue],
//   ['Top-up', Iconsax.import, Colors.pink],
//   ['Bill', Iconsax.wallet_3, Colors.orange],
//   ['More', Iconsax.more, Colors.green],
// ];
//
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.send),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.request_page),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.payment),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.bill),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.more_horiz),
//                     onPressed: () {
//                       // Show the more row of icon buttons
//                     },
//                   ),
//                 ],
//               ),
//               Visibility(
//                 visible: false, // Initially hidden
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.settings),
//                       onPressed: () {},
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.help),
//                       onPressed: () {},
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.feedback),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//
//
//     );
//   }
// }