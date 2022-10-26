import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import 'zodiac_detail_tile_widget.dart';
import '../../data/models/zodiac_model.dart';

class ZodiacDetailWidget extends StatelessWidget {
  final MapEntry<String, ZodiacModel> currentZodiac;
  final int currentZodiacColor;

  const ZodiacDetailWidget({
    super.key,
    required this.currentZodiac,
    required this.currentZodiacColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(currentZodiacColor),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          Column(
            children: [
              Text(
                toBeginningOfSentenceCase(currentZodiac.key) ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  letterSpacing: 1.2,
                  decoration: TextDecoration.underline,
                ),
              ),
              ZodiacDetailTileWidget(
                label: "Compatibility",
                description: currentZodiac.value.compatibility,
              ),
              ZodiacDetailTileWidget(
                label: "Lucky Time",
                description: currentZodiac.value.luckyTime,
              ),
              ZodiacDetailTileWidget(
                label: "Lucky Number",
                description: currentZodiac.value.luckyNumber,
              ),
              ZodiacDetailTileWidget(
                label: "Color",
                description: currentZodiac.value.color,
              ),
              ZodiacDetailTileWidget(
                label: "Date Range",
                description: currentZodiac.value.dateRange,
              ),
              ZodiacDetailTileWidget(
                label: "Mood",
                description: currentZodiac.value.mood,
              ),
              ZodiacDetailTileWidget(
                label: "Description",
                description: currentZodiac.value.description,
              ),
            ],
          )
        ],
      ),
    );
  }
}
