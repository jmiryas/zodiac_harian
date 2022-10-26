import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import '../../core/constants/constants.dart';
import '../../data/models/zodiac_model.dart';
import '../widgets/zodiac_detail_widget.dart';
import '../widgets/zodiac_detail_card_widget.dart';

class ZodiacDetailPage extends StatelessWidget {
  final int zodiacIndex;
  final MapEntry<String, Map<String, ZodiacModel>> zodiac;

  const ZodiacDetailPage({
    super.key,
    required this.zodiacIndex,
    required this.zodiac,
  });

  @override
  Widget build(BuildContext context) {
    final String zodiacImage = zodiacImageList[zodiacIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Zodiac Detail"),
        centerTitle: true,
        backgroundColor: const Color(primaryColor),
      ),
      body: Container(
        color: const Color(secondaryColor),
        child: FlipCard(
          fill: Fill.fillBack,
          direction: FlipDirection.HORIZONTAL,
          front: ZodiacDetailCardWidget(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: SizedBox(
                    width: 300.0,
                    height: 300.0,
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder:
                          const AssetImage("assets/images/loading5.gif"),
                      image: AssetImage("assets/images/$zodiacImage"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  toBeginningOfSentenceCase(zodiac.key) ?? "",
                  style: const TextStyle(
                    fontSize: 35.0,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Tap untuk menampilkan informasi zodiac",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1.0,
                    color: Colors.white,
                  ),
                ),
              ]),
          back: ZodiacDetailCardWidget(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    final currentZodiac = zodiac.value.entries.elementAt(index);
                    final currentZodiacColor = zodiacColorList[index];

                    return ZodiacDetailWidget(
                      currentZodiac: currentZodiac,
                      currentZodiacColor: currentZodiacColor,
                    );
                  },
                  itemCount: zodiac.value.length,
                  itemWidth: 400.0,
                  itemHeight: 450.0,
                  layout: SwiperLayout.TINDER,
                ),
              ]),
        ),
      ),
    );
  }
}
