import 'package:bank_of_ideas/home.dart';
import 'package:bank_of_ideas/onboard.dart';
import 'package:bank_of_ideas/settings.dart';
import 'package:bank_of_ideas/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('ideas');
  await Hive.openBox('user_preferences');

  runApp(const RootWidget());
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bank of Ideas",
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/': (context) => const HomeScreen(),
        '/splash': (context) => const SplashScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/onboard': (context) => const OnboardScreen(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
    );
  }
}
