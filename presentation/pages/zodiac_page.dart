import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/zodiac_bloc.dart';
import '../widgets/zodiac_grid_widget.dart';
import '../../core/constants/constants.dart';
import '../widgets/display_center_widget.dart';

class ZodiacPage extends StatelessWidget {
  const ZodiacPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Zodiac Harian"),
        backgroundColor: const Color(primaryColor),
      ),
      body: BlocBuilder<ZodiacBloc, ZodiacBlocState>(
        builder: ((context, state) {
          late Widget widget;

          if (state is ZodiacBlocInitialState) {
            widget = const DisplayCenterWidget(
              widget: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (state is ZodiacBlocLoadingState) {
            widget = const DisplayCenterWidget(
              widget: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (state is ZodiacBlocLoadedState) {
            widget = Container(
              color: const Color(secondaryColor),
              child: ZodiacGridWidget(zodiacList: state.zodiacList),
            );
          } else if (state is ZodiacBlocErrorState) {
            widget = DisplayCenterWidget(
              widget: Text(
                state.errorMessage,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  letterSpacing: 1.2,
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
