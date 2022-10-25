import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'zodiac_detail_page.dart';
import '../bloc/zodiac_bloc.dart';
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
      body: BlocBuilder<ZodiacBloc, ZodiacBlocState>(
        builder: ((context, state) {
          late Widget widget;

          if (state is ZodiacBlocInitialState) {
            widget = Container(
              color: const Color.fromARGB(255, 63, 76, 110),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          } else if (state is ZodiacBlocLoadingState) {
            widget = Container(
              color: const Color.fromARGB(255, 63, 76, 110),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          } else if (state is ZodiacBlocLoadedState) {
            widget = Container(
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
                children: state.zodiacList.zodiac.entries.map((zodiac) {
                  final zodiacIndex =
                      state.zodiacList.zodiac.keys.toList().indexOf(zodiac.key);

                  final zodiacIcon = zodiacIconList[zodiacIndex];

                  return OpenContainer(
                      closedBuilder: (_, closeContainer) {
                        return Container(
                          color: Colors.grey.shade100,
                          child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder:
                                const AssetImage("assets/images/loading5.gif"),
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
                }).toList(),
              ),
            );
          } else if (state is ZodiacBlocErrorState) {
            widget = Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 63, 76, 110),
              ),
              child: Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            );
          }

          return widget;
        }),
      ),
    );
  }
}
