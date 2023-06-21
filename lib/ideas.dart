import 'package:bank_of_ideas/custom_properties.dart';
import 'package:flutter/material.dart';

// TODO: there is going to be title, short decription, categories, content.
// It will also be displayed in that excact order.

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

  @override
  void initState() {
    super.initState();

    titleController.text = widget.title!;
    descController.text = widget.description!;
    contentController.text = widget.content!;
  }

  @override
  Widget build(BuildContext context) {
    // Section 1 header with back button, title, and short desc.
    // Section 2, scrollView section
    // Section 2-a, categories
    // Section 2-b, content
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorProperties.main,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenSize.width,
              padding: const EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                color: ColorProperties.secondary,
                boxShadow: BoxShadowProperties.cardShadow,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenSize.height * 0.035),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: titleController,
                          cursorColor: Colors.grey,
                          decoration: InputDecorationProperties.clear,
                          style: TextProperties.h1,
                        ),
                        TextField(
                          controller: descController,
                          cursorColor: Colors.grey,
                          decoration: InputDecorationProperties.clear,
                          style: TextProperties.normal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
