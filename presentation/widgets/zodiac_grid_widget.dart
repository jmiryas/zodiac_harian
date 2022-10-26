import 'package:flutter/material.dart';

import 'zodiac_widget.dart';
import '../../core/constants/constants.dart';
import '../../data/models/zodiac_list_model.dart';

class ZodiacGridWidget extends StatelessWidget {
  final ZodiacListModel zodiacList;

  const ZodiacGridWidget({
    super.key,
    required this.zodiacList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150.0,
        mainAxisExtent: 150.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.0,
      ),
      children: zodiacList.zodiac.entries.map((zodiac) {
        final zodiacIndex = zodiacList.zodiac.keys.toList().indexOf(zodiac.key);

        final zodiacIcon = zodiacIconList[zodiacIndex];

        return ZodiacWidget(
          zodiac: zodiac,
          zodiacIcon: zodiacIcon,
          zodiacIndex: zodiacIndex,
        );
      }).toList(),
    );
  }
}
