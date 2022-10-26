import 'package:flutter/material.dart';

class ZodiacDetailTileWidget extends StatelessWidget {
  final String label;
  final String description;

  const ZodiacDetailTileWidget({
    super.key,
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          letterSpacing: 1.0,
        ),
      ),
      subtitle: Text(
        description,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
