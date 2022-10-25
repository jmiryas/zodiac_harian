import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import '../../core/constants/constants.dart';
import '../../data/models/zodiac_model.dart';

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
        backgroundColor: const Color(0xFF303952),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 63, 76, 110),
        ),
        child: FlipCard(
          fill: Fill.fillBack,
          direction: FlipDirection.HORIZONTAL,
          front: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF303952),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        // width: 280.0,
                        height: 280.0,
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
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          back: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF303952),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                final currentZodiac = zodiac.value.entries.elementAt(index);

                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 100.0),
                    child: Card(
                      color: const Color.fromARGB(255, 63, 76, 110),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              toBeginningOfSentenceCase(currentZodiac.key) ??
                                  "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                letterSpacing: 1.2,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            ListTile(
                              title: const Text(
                                "Compatibility",
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              subtitle: Text(
                                currentZodiac.value.compatibility,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ListTile(
                              title: const Text(
                                "Lucky Time",
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              subtitle: Text(
                                currentZodiac.value.luckyTime,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ListTile(
                              title: const Text(
                                "Lucky Number",
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              subtitle: Text(
                                currentZodiac.value.luckyNumber,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ListTile(
                              title: const Text(
                                "Color",
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              subtitle: Text(
                                currentZodiac.value.color,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ListTile(
                              title: const Text(
                                "Date Range",
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              subtitle: Text(
                                currentZodiac.value.dateRange,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ListTile(
                              title: const Text(
                                "Mood",
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              subtitle: Text(
                                currentZodiac.value.mood,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ListTile(
                              title: const Text(
                                "Description",
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              subtitle: Text(
                                currentZodiac.value.description,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: zodiac.value.length,
              layout: SwiperLayout.DEFAULT,
              scrollDirection: Axis.vertical,
            ),
          ),
        ),
      ),
    );
  }
}
