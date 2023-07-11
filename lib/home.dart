import 'package:bank_of_ideas/custom_properties.dart';
import 'package:bank_of_ideas/custom_widgets.dart';
import 'package:bank_of_ideas/ideas.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<bool> selectedCategories = List.generate(20, (index) => false);

  void get() async {}

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenSize.width,
            padding: const EdgeInsets.only(bottom: 12),
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: ColorProperties.secondary,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 8, left: 16),
                  decoration: BoxDecoration(
                    color: ColorProperties.secondary,
                    border: const Border(
                      right: BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.sort_rounded,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Sort By',
                          style: TextProperties.small,
                        )
                      ],
                    ),
                  ),
                ),
                // In here will be the categories
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        selectedCategories.length,
                        (index) {
                          return CategoryToggleButton(
                            categoryColor: Colors.purple,
                            categoryName: "Category1",
                            buttonPressed: () {
                              setState(() {
                                selectedCategories[index] =
                                    !selectedCategories[index];
                              });
                            },
                            isSelected: selectedCategories[index],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Ideas list using custom widgets -> CardIdea
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: screenSize.width,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    for (var i = 0; i < 10; i++)
                      const CardIdea(
                        title: "title",
                        description: "description",
                        categories: [1, 2, 3, 4],
                        content: "nothing to see here",
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
