import 'package:flutter/material.dart';
import 'package:pranav_portfolio/data/header_data.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop(
      {super.key, required this.textsBtnPress, this.logoPress, this.keys});
  final Function(int) textsBtnPress;
  final VoidCallback? logoPress;
  final GlobalKey? keys;

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  List<bool> hoverHeaderBtn = [];
  @override
  void initState() {
    hoverHeaderBtn = List<bool>.filled(headerBtn.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.keys,
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: const LinearGradient(
          colors: [Colors.transparent, CustomColor.bgLight1],
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.logoPress,
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
          for (int i = 0; i < headerBtn.length; i++)
            MouseRegion(
              onEnter: (event) {
                setState(() {
                  hoverHeaderBtn[i] = true;
                });
              },
              onExit: (event) {
                setState(() {
                  hoverHeaderBtn[i] = false;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(
                    right: 20, bottom: hoverHeaderBtn[i] == true ? 20 : 0),
                child: TextButton(
                  onPressed: () {
                    widget.textsBtnPress(i);
                  },
                  child: Text(
                    headerBtn[i],
                    style: const TextStyle(
                      color: CustomColor.whitePrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
