import 'package:flutter/material.dart';
import 'package:pranav_portfolio/data/header_data.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';
import 'package:pranav_portfolio/utils/constants/size.dart';
import 'package:pranav_portfolio/utils/constants/url_launcher.dart';
import 'package:pranav_portfolio/widgets/custom_text_field.dart';

class GetItTouchDesktop extends StatelessWidget {
  const GetItTouchDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController msgController = TextEditingController();
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      decoration: BoxDecoration(
        color: CustomColor.bgLight1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: 28,
              color: CustomColor.whitePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700, maxHeight: 100),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= kMindesktopWid) {
                  return buildTextformDesktop(
                      emailController: emailController,
                      nameController: nameController);
                }
                return buildTextformMobile(
                    emailController: emailController,
                    nameController: nameController);
              },
            ),
          ),
          const SizedBox(height: 20),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: CustomTextField(
              controller: msgController,
              hintText: "message",
              maxLines: 16,
            ),
          ),
          const SizedBox(height: 20),
          //send button
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              height: 60,
              width: double.maxFinite,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(CustomColor.yellowPrimary)),
                onPressed: () {
                  emailUrlLunch(
                      name: nameController.text,
                      email: emailController.text,
                      msg: msgController.text);
                },
                child: const Text(
                  "Get in touch",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: const Divider(),
          ),
          const SizedBox(height: 15),
          Wrap(
            runSpacing: 12,
            spacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  launchUrlLink(socialMedia[0]);
                },
                child: Image.asset(
                  'assets/connect-platforms/linkedin.png',
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  launchUrlLink(socialMedia[1]);
                },
                child: Image.asset(
                  'assets/connect-platforms/github.png',
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  launchUrlLink(socialMedia[2]);
                },
                child: Image.asset(
                  'assets/connect-platforms/instagram.png',
                  width: 28,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTextformDesktop(
      {required TextEditingController nameController,
      required TextEditingController emailController}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: CustomTextField(
            controller: nameController,
            hintText: "your name",
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Flexible(
          child: CustomTextField(
            controller: emailController,
            hintText: "your email",
          ),
        ),
      ],
    );
  }

  Widget buildTextformMobile(
      {required TextEditingController nameController,
      required TextEditingController emailController}) {
    return Column(
      children: [
        Flexible(
          child: CustomTextField(
            controller: nameController,
            hintText: "Your name",
          ),
        ),
        const SizedBox(height: 15),
        Flexible(
          child: CustomTextField(
            controller: emailController,
            hintText: "Your email",
          ),
        ),
      ],
    );
  }
}
