import 'package:card_swiper/card_swiper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class ZodiacDetailPage extends StatelessWidget {
  const ZodiacDetailPage({super.key});

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
            ),
            back: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF303952),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Text(
                      "$index",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                      ),
                    ),
                  );
                },
                itemCount: 5,
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
