import 'dart:math';

import 'package:bank_of_ideas/custom_properties.dart';
import 'package:bank_of_ideas/custom_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class IdeaScreen extends StatefulWidget {
  final String? title;
  final String? description;
  final List? categories;
  final String? content;

  const IdeaScreen(
      {required this.title,
      required this.description,
      required this.categories,
      required this.content,
      super.key});

  @override
  State<IdeaScreen> createState() => _IdeaScreen();
}

class _IdeaScreen extends State<IdeaScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  List<bool> selectedCategories = List.generate(7, (index) => false);
  List<bool> expanded = List.generate(2, (index) => false);

  @override
  void initState() {
    super.initState();

    titleController.text = widget.title!;
    descController.text = widget.description!;
    contentController.text = widget.content!;
  }

  void addCategory() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            for (int i = 0; i < 3; i++)
              SimpleDialogOption(
                onPressed: () {},
                child: Text('Category ${Random().nextInt(9999)}'),
              ),
          ],
        );
      },
    );
  }

  VoidCallback removeCategory(int index) {
    return () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text('Remove this category?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    selectedCategories.removeAt(index);
                  });
                },
                child: Text(
                  'Yes',
                  style: TextProperties.redNormal,
                ),
              ),
            ],
          );
        },
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        foregroundColor: Colors.black87,
        backgroundColor: ColorProperties.secondary,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: ColorProperties.main,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ExpansionPanelList(
              elevation: 1,
              dividerColor: ColorProperties.secondary,
              animationDuration: const Duration(milliseconds: 350),
              expandedHeaderPadding: const EdgeInsets.all(0),
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  expanded[panelIndex] = !expanded[panelIndex];
                });
              },
              children: [
                ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: expanded[0],
                  backgroundColor: ColorProperties.secondary,
                  headerBuilder: (context, isExpanded) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 24),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("General"),
                      ),
                    );
                  },
                  body: Container(
                    width: screenSize.width,
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 16, right: 24, left: 24),
                    decoration: BoxDecoration(
                      color: ColorProperties.secondary,
                      boxShadow: BoxShadowProperties.cardShadow,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenSize.width * 0.65,
                          child: TextField(
                            controller: titleController,
                            cursorColor: Colors.grey,
                            decoration:
                                InputDecorationProperties.clear('Title'),
                            style: TextProperties.h1,
                            maxLength: 64,
                          ),
                        ),
                        TextField(
                          controller: descController,
                          cursorColor: Colors.grey,
                          decoration: InputDecorationProperties.clear(
                              'Short description'),
                          style: TextProperties.normal,
                          minLines: 1,
                          maxLines: 5,
                          maxLength: 256,
                        ),
                      ],
                    ),
                  ),
                ),
                // If a user ever to add too much categories, there will be no
                // room for the content/long description
                ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: expanded[1],
                    backgroundColor: ColorProperties.secondary,
                    headerBuilder: (context, isExpanded) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Categories"),
                        ),
                      );
                    },
                    // Perhaps a scrollview will be added somewhere in here
                    body: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: double.infinity,
                        minHeight: screenSize.height * 0.1,
                        maxHeight: screenSize.height * 0.3,
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 24, right: 24, left: 24),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (var i = 0;
                                    i < selectedCategories.length;
                                    i++)
                                  CategoryButton(
                                    categoryColor: Colors.purple,
                                    categoryName:
                                        "Category ${Random().nextInt(9999)}",
                                    buttonPressed: removeCategory(i),
                                  ),
                                // When pressed, a dialog with list of categories is shown
                                CategoryButton(
                                  categoryColor: ColorProperties.secondary!,
                                  categoryName: "Add Category",
                                  buttonPressed: addCategory,
                                  isAddCategory: true,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Column(
                    children: [
                      TextField(
                        controller: contentController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecorationProperties.clear(
                            "Describe your idea in detail here..."),
                        cursorColor: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
