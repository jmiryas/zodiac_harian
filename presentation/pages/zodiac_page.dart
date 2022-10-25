import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'zodiac_detail_page.dart';
import '../../core/constants/constants.dart';

class ZodiacPage extends StatelessWidget {
  const ZodiacPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Zodiac Harian"),
        backgroundColor: const Color(0xFF303952),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 63, 76, 110),
        ),
        child: GridView(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150.0,
            mainAxisExtent: 150.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          children: zodiacSignString.asMap().entries.map((zodiac) {
            String zodiacIcon = zodiacIconList[zodiac.key];

            return OpenContainer(
                closedBuilder: (_, closeContainer) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/$zodiacIcon"),
                      ),
                    ),
                  );
                },
                openColor: Colors.transparent,
                closedElevation: 5.0,
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                openShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                closedColor: Colors.transparent,
                openBuilder: (_, openContainer) {
                  return const ZodiacDetailPage();
                });
          }).toList(),
        ),
      ),
    );
  }
}
