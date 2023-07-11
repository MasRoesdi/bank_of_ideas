import 'package:bank_of_ideas/category.dart';
import 'package:bank_of_ideas/custom_properties.dart';
import 'package:bank_of_ideas/home.dart';
import 'package:bank_of_ideas/ideas.dart';
import 'package:flutter/material.dart';

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({super.key});

  @override
  State<HomeScaffold> createState() => _HomeScaffold();
}

class _HomeScaffold extends State<HomeScaffold> {
  List<Widget> pages = [];

  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    pages.addAll([const HomeScreen(), const CategoryScreen()]);
  }

  void addItem() {
    switch (currentPage) {
      // If the current page is home, then navigate to add new idea
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const IdeaScreen(
              title: "New Idea",
              description: "",
              categories: [1],
              content: "",
            ),
          ),
        );
        break;
      // If the current page is category, then navigate to add new category
      case 1:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Maybe we could add a search button, with regex to find the result
      appBar: AppBar(
        backgroundColor: ColorProperties.secondary,
        foregroundColor: Colors.black54,
        elevation: currentPage == 1 ? 8 : 0,
        actions: currentPage == 1
            ? [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: DropdownButton(
                    elevation: 0,
                    items: const [
                      DropdownMenuItem(child: Text('a'), value: 1),
                      DropdownMenuItem(child: Text('a'), value: 2),
                      DropdownMenuItem(child: Text('a'), value: 3),
                      DropdownMenuItem(child: Text('a'), value: 4),
                    ],
                    onChanged: (value) {},
                    icon: const Icon(Icons.sort),
                  ),
                ),
              ]
            : [],
      ),
      backgroundColor: ColorProperties.main,
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        foregroundColor: Colors.black54,
        backgroundColor: ColorProperties.main,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            const Icon(Icons.add),
            Positioned(
              bottom: -24,
              left: -24,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: BoxShadowProperties.cardShadow,
                  color: ColorProperties.main,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: currentPage == 0
                    ? const Icon(
                        Icons.lightbulb,
                        size: 16,
                      )
                    : const Icon(
                        Icons.category,
                        size: 16,
                      ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorProperties.secondary,
        selectedItemColor: Colors.black87.withOpacity(0.75),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Category",
            icon: Icon(Icons.category),
          ),
        ],
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
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
      body: pages[currentPage],
    );
  }
}
