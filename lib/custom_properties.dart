import 'package:flutter/material.dart';

class TextProperties {
  static const TextStyle h1 = TextStyle(
    color: Colors.black87,
    fontSize: 24,
  );

  static const TextStyle h2 = TextStyle(
    color: Colors.black54,
    fontSize: 20,
  );

  static const TextStyle normal = TextStyle(
    color: Colors.black54,
    fontSize: 16,
  );

  static TextStyle redNormal = TextStyle(
    color: Colors.red[600],
    fontSize: 16,
  );

  static const TextStyle small = TextStyle(
    color: Colors.black54,
    fontSize: 14,
  );

  static const TextStyle smallThick = TextStyle(
    color: Colors.black87,
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

class InputDecorationProperties {
  static InputDecoration clear(String hint) {
    return InputDecoration(
      hintText: hint,
      border: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black38,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black54,
        ),
      ),
    );
  }
}
