import 'package:flutter/material.dart';

class DisplayCenterWidget extends StatelessWidget {
  final Widget widget;

  const DisplayCenterWidget({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF576574),
      ),
      child: Center(
        child: widget,
      ),
    );
  }
}
