import 'package:bank_of_ideas/custom_properties.dart';
import 'package:flutter/material.dart';

class CardIdea extends StatelessWidget {
  final String? title;
  final String? description;
  final List? categories;

  const CardIdea(
      {required this.title,
      required this.description,
      required this.categories,
      super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.95,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.yellow[400],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: TextProperties.h1,
          ),
          Text(
            '$description',
            style: TextProperties.normal,
          ),
          Text(
            '$categories',
            style: TextProperties.normal,
          ),
        ],
      ),
    );
  }
}
