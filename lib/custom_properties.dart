import 'package:flutter/material.dart';

class TextProperties {
  static const TextStyle h1 = TextStyle(
    color: Colors.black87,
    fontSize: 24,
  );

  static const TextStyle normal = TextStyle(
    color: Colors.black54,
    fontSize: 16,
  );

  static const TextStyle small = TextStyle(
    color: Colors.black54,
    fontSize: 14,
  );
}

class ColorProperties {
  static Color? main = Colors.grey[100];
  static Color? secondary = Colors.grey[200];
}

class BoxShadowProperties {
  static List<BoxShadow> cardShadow = [
    const BoxShadow(
      color: Colors.black26,
      offset: Offset(0, 1),
      blurRadius: 4,
    )
  ];
}
