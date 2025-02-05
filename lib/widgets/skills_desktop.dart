import 'package:flutter/material.dart';
import 'package:pranav_portfolio/data/header_data.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';

class SkillsDesktop extends StatefulWidget {
  const SkillsDesktop({super.key});

  @override
  State<SkillsDesktop> createState() => _SkillsDesktopState();
}

class _SkillsDesktopState extends State<SkillsDesktop> {
  List<bool> hoverPlatform = [];
  List<bool> hoverSkillItems = [];
  @override
  void initState() {
    hoverPlatform = List<bool>.filled(platFormItems.length, false);
    hoverSkillItems = List<bool>.filled(skillItems.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // platforms
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 450,
          ),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for (int i = 0; i < platFormItems.length; i++)
                MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      hoverPlatform[i] = true;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      hoverPlatform[i] = false;
                    });
                  },
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: hoverPlatform[i] == true
                          ? Colors.white
                          : CustomColor.bgLight2,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      leading: Image.asset(
                        platFormItems[i]["img"],
                        width: 26.0,
                        color: hoverPlatform[i] == true
                            ? Colors.black
                            : Colors.white,
                      ),
                      title: Text(
                        platFormItems[i]["title"],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: hoverPlatform[i] == true
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(width: 50),

        // skills
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                for (int i = 0; i < skillItems.length; i++)
                  MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        hoverSkillItems[i] = true;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        hoverSkillItems[i] = false;
                      });
                    },
                    child: Chip(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      backgroundColor: hoverSkillItems[i] == true
                          ? Colors.white
                          : CustomColor.bgLight2,
                      label: Text(
                        skillItems[i]["title"],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: hoverSkillItems[i] == true
                                ? Colors.black
                                : Colors.white),
                      ),
                      avatar: Image.asset(
                        skillItems[i]["img"],
                        fit: BoxFit.cover,
                        height: 50,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
