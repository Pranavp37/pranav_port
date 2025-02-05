import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';
import 'package:pranav_portfolio/utils/constants/size.dart';
import 'package:pranav_portfolio/widgets/drawer_mobile.dart';
import 'package:pranav_portfolio/widgets/footer/footer.dart';
import 'package:pranav_portfolio/widgets/get_it_touch/get_it_touch_desktop.dart';
import 'package:pranav_portfolio/widgets/header_desktop.dart';
import 'package:pranav_portfolio/widgets/header_mobile.dart';
import 'package:pranav_portfolio/widgets/main_desktop.dart';
import 'package:pranav_portfolio/widgets/main_mobile.dart';
import 'package:pranav_portfolio/widgets/project_desktop.dart';
import 'package:pranav_portfolio/widgets/project_mobile.dart';
import 'package:pranav_portfolio/widgets/skills_desktop.dart';
import 'package:pranav_portfolio/widgets/skills_mobile.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<GlobalKey> navKeys = List.generate(
    4,
    (index) => GlobalKey(),
  );

  @override
  Widget build(BuildContext context) {
    final scafflodKey = GlobalKey<ScaffoldState>();
    final maxSize = MediaQuery.of(context).size;
    final ScrollController scrollController = ScrollController();

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scafflodKey,
        drawerScrimColor: Colors.white,
        endDrawer: constraints.maxWidth >= kMindesktopWid
            ? null
            : DrawerMobile(
                navFunc: (int navIndex) {
                  scafflodKey.currentState!.closeEndDrawer();
                  scallSectionFunc(navIndex);
                },
              ),
        backgroundColor: CustomColor.scaffoldBg,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: scrollController,
          child: Column(
            children: [
              //header
              if (constraints.maxWidth >= kMindesktopWid)
                HeaderDesktop(
                  // keys: _widget1Key,
                  textsBtnPress: (int navIndex) {
                    scallSectionFunc(navIndex);
                  },
                )
              else
                HeaderMobile(menuBtnPress: () {
                  scafflodKey.currentState!.openEndDrawer();
                }),
              SizedBox(
                height: 50,
                key: navKeys.first,
              ),
              //mainSectionPP
              if (constraints.maxWidth >= kMindesktopWid)
                MainDesktop(
                  navFunc: (int navIndex) {
                    scallSectionFunc(navIndex);
                  },
                )
              else
                const MainMobile(),
              const SizedBox(
                height: 140,
                // key: navKeys.first,
              ),
              //skillsSection
              Container(
                key: navKeys[1],
                width: maxSize.width,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //titile
                    const Text(
                      'What I can do',
                      style: TextStyle(
                        fontSize: 28,
                        color: CustomColor.whitePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // platforms
                    if (constraints.maxWidth >= kMindesktopWid)
                      const SkillsDesktop()
                    else
                      const SkillsMobile()
                  ],
                ),
              ),
              //ProjectsSection
              Container(
                key: navKeys[2],
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                width: maxSize.width,
                color: CustomColor.scaffoldBg,
                child: Column(
                  children: [
                    //titile
                    const Text(
                      'Projects',
                      style: TextStyle(
                        fontSize: 28,
                        color: CustomColor.whitePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    if (constraints.maxWidth >= kMindesktopWid)
                      const ProjectDesktop()
                    else
                      const ProjectMobile(),
                  ],
                ),
              ),
              //get it touch  // maxLines: 3,
              Container(
                key: navKeys[3],
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                width: maxSize.width,
                color: CustomColor.scaffoldBg,
                child: const Column(
                  children: [
                    GetItTouchDesktop(),
                  ],
                ),
              ),
              //Footer
              const Footer()
            ],
          ),
        ),
      );
    });
  }

  scallSectionFunc(int navIndex) {
    final keys = navKeys[navIndex];
    Scrollable.ensureVisible(keys.currentContext!,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
