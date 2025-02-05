import 'package:flutter/material.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: const Text(
        "Made by Pranav P with Flutter 3.24",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: CustomColor.whiteSecondary,
        ),
      ),
    );
  }
}