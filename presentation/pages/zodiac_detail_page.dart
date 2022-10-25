import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import '../../data/models/zodiac_model.dart';

class ZodiacDetailPage extends StatelessWidget {
  final MapEntry<String, Map<String, ZodiacModel>> zodiac;

  const ZodiacDetailPage({
    super.key,
    required this.zodiac,
  });

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FlipCard(
            fill: Fill
                .fillBack, // Fill the back side of the card to make in the same size as the front.
            direction: FlipDirection.HORIZONTAL, // default
            front: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF303952),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  toBeginningOfSentenceCase(zodiac.key) ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    letterSpacing: 1.2,
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
                      padding: const EdgeInsets.all(8.0),
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
                  );
                },
                itemCount: zodiac.value.length,
                itemWidth: 300.0,
                itemHeight: 400.0,
                layout: SwiperLayout.DEFAULT,
                scrollDirection: Axis.vertical,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
