import 'package:flutter/material.dart';
import 'package:pranav_portfolio/data/header_data.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key, required this.navFunc});
  final Function(int) navFunc;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 20,
                bottom: 20,
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)),
            ),
          ),
          for (int i = 0; i < headerNavIcons.length; i++)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              titleTextStyle: const TextStyle(
                color: CustomColor.whitePrimary,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              onTap: () {
                navFunc(i);
              },
              leading: Icon(headerNavIcons[i]),
              title: Text(headerBtn[i]),
            )
        ],
      ),
    );
  }
}
