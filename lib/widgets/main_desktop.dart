import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';
import 'package:pranav_portfolio/utils/constants/url_launcher.dart';

// ignore: must_be_immutable
class MainDesktop extends StatelessWidget {
  const MainDesktop({
    super.key,
    required this.navFunc,
  });
  final Function(int) navFunc;
  @override
  Widget build(BuildContext context) {
    final maxSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: maxSize.height / 1.6,
      constraints: const BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Hai,\nI'm Pranav P\nA Flutter Developer",
                      textStyle: const TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 1,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 155,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                          textStyle: WidgetStatePropertyAll(
                              TextStyle(fontWeight: FontWeight.bold)),
                          elevation: WidgetStatePropertyAll(0),
                          backgroundColor: WidgetStatePropertyAll(
                            CustomColor.yellowPrimary,
                          ),
                        ),
                        //https://www.linkedin.com/in/pranav-p3/
                        onPressed: () async {
                          navFunc(3);
                        },
                        child: const Text(
                          'Get in touch',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: CustomColor.yellowPrimary, width: 2)),
                    height: 50,
                    width: 155,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                          textStyle: WidgetStatePropertyAll(
                              TextStyle(fontWeight: FontWeight.bold)),
                          elevation: WidgetStatePropertyAll(0),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.transparent),
                        ),
                        //https://www.linkedin.com/in/pranav-p3/
                        onPressed: () async {
                          launchUrlLink(
                              'https://drive.google.com/file/d/1pXnejSIivJlnTxYTUOtqvUjVBQ65j76c/view?usp=drive_link');
                        },
                        child: const Text(
                          'Resume',
                          style: TextStyle(
                              color: CustomColor.yellowPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            'assets/img/pranav_img.png',
            height: maxSize.height / 2,
            width: maxSize.width / 3,
          )
        ],
      ),
    );
  }
}
