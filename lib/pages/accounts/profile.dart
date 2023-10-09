import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:dubspay/constraints/repository.dart';
import 'package:dubspay/widgets/custom_list_tile.dart';
import 'package:iconsax/iconsax.dart';

class Profile extends StatelessWidget {

  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Repository.bgColor(context),

      body: SlideInDown(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const Gap(40),
            Stack(
              children: [
                Container(
                  height: 280,
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Repository.accentColor(context),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xfcb2d0a0),
                          Color(0xfcd0cea0),
                          Color(0xfca4d5ca),
                          Color(0xfcb2d0a0),
                        ]
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Gap(60),
                        Center(
                            child: Text('Mundie Kaweche',
                                style: TextStyle(
                                  fontFamily: 'Oregon',
                                    color: Repository.textColor(context), fontSize: 20, fontWeight: FontWeight.bold))),
                        const Gap(10),
                        Text('patrickcraving@gmail.com',
                            style:
                            TextStyle( fontFamily: 'OCR',
                                color: Repository.subTextColor(context))),
                        const Gap(25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: profilesShortcutList.map<Widget>((e) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                              padding: const EdgeInsets.all(13),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(e['icon'], color: e['color']),
                            );
                          }).toList(),
                        ),
                        const Gap(25)
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  right: 30,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue
                    ),
                    child: Transform.scale(
                      scale: 0.55,
                      child: Image.asset('assets/placeholder/proholder.png',fit: BoxFit.fitHeight,),
                    ),
                  ),
                )
              ],
            ),
            const Gap(35),
            CustomListTile(
                icon: Iconsax.activity,
                color: const Color(0xFF0B8921),
                title: 'Investment Portfolio', context: context),
            CustomListTile(
                icon: Iconsax.people ,
                title: 'Group Savings',
                color: Colors.blue,
                context: context),
            CustomListTile(icon: Iconsax.note, title: 'My Budget', color: Colors.blueGrey, context: context),
            CustomListTile(
                icon: Iconsax.shield,
                color: const Color(0xFF229e76),
                title: 'Security', context: context),
            CustomListTile(
                icon: Iconsax.message,
                color: const Color(0xFFe17a0a),
                title: 'Contact us', context: context),
            CustomListTile(
                icon: Iconsax.document,
                color: const Color(0xFF064c6d),
                title: 'Support', context: context),
            CustomListTile(
                icon: Icons.dark_mode,
                color: const Color(0xFF0536e8),
                title: 'Dark Mode',
                isDarkMode: true, context: context),
          ],
        ),
      ),
    );
  }
}

List profilesShortcutList = [
  {
    'color': const Color(0xFFe2a935),
    'icon': Iconsax.chart,
  },
  {
    'color': const Color(0xFF2290b8),
    'icon': Iconsax.notification,
  },
  {
    'color': const Color(0xFF6bcde8),
    'icon': Iconsax.setting,
  },
  {
    'color': const Color(0xFF6b41dc),
    'icon': Iconsax.logout,
  },
];

