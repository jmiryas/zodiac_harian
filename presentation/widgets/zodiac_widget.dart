import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import '../pages/zodiac_detail_page.dart';
import '../../data/models/zodiac_model.dart';

class ZodiacWidget extends StatelessWidget {
  final MapEntry<String, Map<String, ZodiacModel>> zodiac;
  final String zodiacIcon;
  final int zodiacIndex;

  const ZodiacWidget({
    super.key,
    required this.zodiac,
    required this.zodiacIcon,
    required this.zodiacIndex,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedBuilder: (_, closeContainer) {
          return Container(
            color: Colors.grey.shade100,
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: const AssetImage("assets/images/loading5.gif"),
              image: AssetImage("assets/images/$zodiacIcon"),
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
          return ZodiacDetailPage(
            zodiacIndex: zodiacIndex,
            zodiac: zodiac,
          );
        });
  }
}
