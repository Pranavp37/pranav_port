import 'package:flutter/material.dart';
import 'package:pranav_portfolio/data/header_data.dart';
import 'package:pranav_portfolio/utils/constants/url_launcher.dart';
import 'package:pranav_portfolio/widgets/projct_container/mobile/mobile_scn_project_container.dart';

class ProjectMobile extends StatefulWidget {
  const ProjectMobile({super.key});

  @override
  State<ProjectMobile> createState() => _ProjectMobileState();
}

class _ProjectMobileState extends State<ProjectMobile>
    with SingleTickerProviderStateMixin {
  // bool isHover = false;
  // late List<bool> hoverState;

  @override
  void initState() {
    // hoverState = List<bool>.filled(projcts.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < projcts.length; i++)
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: MobileScreenProContainer(
                index: i,
                onTap: () {
                  launchUrlLink(projectLink[i]);
                },
              )),
      ],
    );
  }
}
