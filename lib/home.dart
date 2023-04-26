import 'package:bank_of_ideas/custom_properties.dart';
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
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void get() async {}

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // Make sure not to make the background too bright
      key: scaffoldKey,
      backgroundColor: ColorProperties.main,
      floatingActionButton: FloatingActionButton(
        onPressed: get,
        foregroundColor: Colors.black54,
        backgroundColor: ColorProperties.main,
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        backgroundColor: ColorProperties.main,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: ColorProperties.secondary,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: const Text('Bank of Ideas'),
            ),
            ListTile(
              leading: const Icon(
                Icons.download_rounded,
                color: Colors.black54,
              ),
              title: const Text('Import Ideas'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.upload_rounded,
                color: Colors.black54,
              ),
              title: const Text('Export Ideas'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings_rounded,
                color: Colors.black54,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenSize.width,
              padding: const EdgeInsets.symmetric(vertical: 12),
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
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: Colors.black54,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  // Something like a categories selector in a horizontal scrollview
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //  Perhaps there will be a sort button, who knows
                        Container(
                          padding: const EdgeInsets.only(right: 4),
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
                              children: List.generate(selectedCategories.length,
                                  (index) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: TextButton(
                                    style: const ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.zero),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(256),
                                          ),
                                        ),
                                      ),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        selectedCategories[index] =
                                            !selectedCategories[index];
                                      });
                                    },
                                    child: CategoryButton(
                                      categoryColor: Colors.purple,
                                      categoryName: "Category1",
                                      isSelected: selectedCategories[index],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Ideas list using custom widgets -> CardIdea
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: screenSize.width,
                  child: Column(
                    children: [
                      for (var i = 0; i < 10; i++)
                        const CardIdea(
                          title: "title",
                          description: "description",
                          categories: [1, 2, 3, 4],
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
