import 'package:flutter/material.dart';
import 'package:pranav_portfolio/data/header_data.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';

class ProjectSmallContainer extends StatefulWidget {
  const ProjectSmallContainer({super.key, required this.index});
  final int index;

  @override
  State<ProjectSmallContainer> createState() => _ProjectSmallContainerState();
}

class _ProjectSmallContainerState extends State<ProjectSmallContainer> {
  @override
  Widget build(BuildContext context) {
    final maxSize = MediaQuery.of(context).size;
    return Container(
        width: maxSize.width * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColor.bgLight1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  projcts[widget.index]['imageUrl'],
                  fit: BoxFit.cover,
                  height: maxSize.height * 0.3,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              projcts[widget.index]['title'],
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}
