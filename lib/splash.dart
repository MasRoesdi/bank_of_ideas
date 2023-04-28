import 'dart:async';

import 'package:bank_of_ideas/custom_properties.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    var box = Hive.box('user_preferences');
    bool? isOnboardingSeen = box.get('onboarding_seen');

    if (isOnboardingSeen == null) {
      Timer(
        const Duration(milliseconds: 2500),
        () {
          Navigator.pushReplacementNamed(context, '/onboard');
        },
      );
    } else {
      Timer(
        const Duration(milliseconds: 2500),
        () {
          Navigator.pushReplacementNamed(context, '/');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorProperties.main,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.lightbulb,
              color: Colors.black87,
              size: 72,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Bank of Ideas',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
