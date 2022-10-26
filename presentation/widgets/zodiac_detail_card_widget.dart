import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';

class ZodiacDetailCardWidget extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;
  const ZodiacDetailCardWidget({
    super.key,
    required this.children,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(secondaryColor),
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      ),
    );
  }
}
