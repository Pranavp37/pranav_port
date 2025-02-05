import 'package:flutter/material.dart';
import 'package:motion/motion.dart';
import 'package:pranav_portfolio/data/header_data.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';

class ProjectLargeContainer extends StatelessWidget {
  const ProjectLargeContainer(
      {super.key, required this.index, required this.onTap});

  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final maxSize = MediaQuery.of(context).size;

    return Motion(
      borderRadius: BorderRadius.circular(10),
      filterQuality: FilterQuality.low,
      child: Container(
          width: maxSize.width * 0.2,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColor.bgLight1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    projcts[index]['imageUrl'],
                    fit: BoxFit.cover,
                    height: maxSize.height * 0.3,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                projcts[index]['title'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                // maxLines: 3,
                textAlign: TextAlign.start,
                projcts[index]['desc'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: onTap,
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColor.yellowPrimary),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    "View Code",
                    style: TextStyle(
                        color: CustomColor.yellowPrimary, fontSize: 16),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
