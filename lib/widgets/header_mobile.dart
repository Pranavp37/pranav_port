import 'package:flutter/material.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.menuBtnPress, this.logoPress});
  final VoidCallback? menuBtnPress;
  final VoidCallback? logoPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: const LinearGradient(
          colors: [Colors.transparent, CustomColor.bgLight1],
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: logoPress,
            child: const Text(
              'PP',
              style: TextStyle(
                color: CustomColor.yellowSecondary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          IconButton(onPressed: menuBtnPress, icon: const Icon(Icons.menu)),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
