import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';
import 'package:pranav_portfolio/utils/constants/url_launcher.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final maxSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
      height: maxSize.height,
      constraints: const BoxConstraints(maxWidth: 560.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
          Align(
            alignment: const Alignment(.2, .1),
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(colors: [
                  CustomColor.scaffoldBg.withOpacity(0.6),
                  CustomColor.scaffoldBg.withOpacity(0.6),
                ]).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Image.asset(
                'assets/img/pranav_img.png',
                width: maxSize.width / 2.6,
              ),
            ),
          ),
          const SizedBox(height: 30),
          //into message
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                "Hai,\nI'm Pranav P\nA Flutter Developer",
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 1,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 50,
            width: 180,
            child: ElevatedButton(
              style: const ButtonStyle(
                textStyle: WidgetStatePropertyAll(
                  TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                elevation: WidgetStatePropertyAll(0),
                backgroundColor: WidgetStatePropertyAll(
                  CustomColor.yellowPrimary,
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Get in touch',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: CustomColor.yellowPrimary, width: 2)),
            height: 50,
            width: 185,
            child: ElevatedButton(
                style: const ButtonStyle(
                  textStyle: WidgetStatePropertyAll(
                    TextStyle(fontWeight: FontWeight.bold),
                  ),
                  elevation: WidgetStatePropertyAll(0),
                  backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                ),
                //https://www.linkedin.com/in/pranav-p3/
                onPressed: () async {
                  launchUrlLink('https://www.linkedin.com/in/pranav-p3/');
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
    );
  }
}
