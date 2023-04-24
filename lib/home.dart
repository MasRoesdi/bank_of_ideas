import 'package:bank_of_ideas/custom_widgets.dart';
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

    return Scaffold(
      // Make sure not to make the background too bright
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: get,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              padding: const EdgeInsets.only(
                  top: 24, right: 18, bottom: 12, left: 18),
              decoration: BoxDecoration(
                color: Colors.yellow[600],
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.cloud_upload_sharp,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            // Something like a categories selector in a horizontal scrollview
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 12, horizontal: screenSize.width * 0.025),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //  Perhaps there will be a sort button, who knows
                    SizedBox(
                      child: TextButton(
                        onPressed: () {},
                        child: Row(),
                      ),
                    ),
                    // In here will be the categories
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:
                          List.generate(selectedCategories.length, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextButton(
                            style: const ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(48),
                                  ),
                                ),
                              ),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              setState(() {
                                selectedCategories[index] =
                                    !selectedCategories[index];
                              });
                            },
                            child: CategoryButton(
                              categoryColor: Colors.blue,
                              categoryName: "Category1",
                              isSelected: selectedCategories[index],
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            // Ideas list using custom widgets -> CardIdea
            const CardIdea(
              title: "title",
              description: "description",
              categories: [1, 2, 3, 4],
            ),
          ],
        ),
      ),
    );
  }
}
