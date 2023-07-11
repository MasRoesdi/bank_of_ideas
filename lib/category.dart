import 'package:bank_of_ideas/custom_properties.dart';
import 'package:bank_of_ideas/custom_widgets.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreen();
}

class _CategoryScreen extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Content, categories.
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: screenSize.width,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    for (var i = 0; i < 10; i++)
                      CategoryButton(
                        buttonPressed: () {},
                        categoryColor: Colors.purple,
                        categoryName: "Something$i",
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
