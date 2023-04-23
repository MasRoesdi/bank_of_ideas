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
            Container(),
            // Something like a categories selector in a horizontal scrollview
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //  Perhaps there will be a sort button, who knows
                  // In here will be the categories
                ],
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
