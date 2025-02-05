import 'package:flutter/material.dart';
import 'package:pranav_portfolio/data/header_data.dart';
import 'package:pranav_portfolio/utils/constants/url_launcher.dart';
import 'package:pranav_portfolio/widgets/projct_container/project_large_container.dart';
import 'package:pranav_portfolio/widgets/projct_container/project_small_container.dart';

class ProjectDesktop extends StatefulWidget {
  const ProjectDesktop({super.key});

  @override
  State<ProjectDesktop> createState() => _ProjectDesktopState();
}

class _ProjectDesktopState extends State<ProjectDesktop>
    with SingleTickerProviderStateMixin {
  bool isHover = false;
  late List<bool> hoverState;

  @override
  void initState() {
    hoverState = List<bool>.filled(projcts.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < projcts.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MouseRegion(
              onEnter: (event) {
                setState(() {
                  isHover = true;

                  hoverState[i] = true;
                });
              },
              onExit: (event) {
                setState(() {
                  isHover = false;
                  hoverState[i] = false;
                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: hoverState[i]
                    ? ProjectLargeContainer(
                        onTap: () {
                          launchUrlLink(projectLink[i]);
                        },
                        index: i,
                      )
                    : ProjectSmallContainer(
                        index: i,
                      ),
              ),
            ),
          ),
      ],
    );
  }
}
