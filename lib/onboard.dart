import 'package:bank_of_ideas/custom_properties.dart';
import 'package:bank_of_ideas/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreen();
}

class _OnboardScreen extends State<OnboardScreen> {
  PageController pageController = PageController(initialPage: 0);

  // Here are the source of the images that is being used in the onboarding page
  // https://unsplash.com/photos/49iJ7bzbCoI?utm_source=unsplash&utm_medium=referral&utm_content=creditShareLink
  // https://unsplash.com/photos/dyaxQ-aoGWY?utm_source=unsplash&utm_medium=referral&utm_content=creditShareLink
  // https://unsplash.com/photos/1dsceUpkOwI?utm_source=unsplash&utm_medium=referral&utm_content=creditShareLink
  // https://unsplash.com/photos/huT1A8nW_Ho?utm_source=unsplash&utm_medium=referral&utm_content=creditShareLink

  List<Widget> onboardingPages = const [
    OnboardPage(
      title: "Type Your Ideas",
      subtitle:
          "Have an idea for something? Start writing it right away! Would be a waste if you ended up forgetting it.",
      imagePath: 'assets/images/start_writing.jpg',
    ),
    OnboardPage(
      title: "Organize!",
      subtitle:
          "Organize and sort your ideas with a custom tag. No time to waste for searching those group of ideas.",
      imagePath: 'assets/images/organize.jpg',
    ),
    OnboardPage(
      title: "Save Progress",
      subtitle:
          "Save your ideas online to avoid losing them. You can also save them offline with no internet needed.",
      imagePath: 'assets/images/save_progress.jpg',
    ),
    OnboardPage(
      title: "Ready to Start?",
      subtitle:
          "Now that everything has been settled. Let's get started right away!",
      imagePath: 'assets/images/ready_to_start.jpg',
    ),
  ];

  int currentPage = 0;

  void finishOnboard() async {
    var box = Hive.box('user_preferences');
    await box.put('onboarding_seen', true);

    if (mounted) {
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorProperties.main,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                children: onboardingPages,
              ),
            ),
            Container(
              width: screenSize.width,
              height: screenSize.height * 0.175,
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // The PageView hasn't been initialized yet. It makes the page
                  // controller can't access some of it's functionality,
                  // including '.page'.
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      onboardingPages.length,
                      (index) => AnimatedContainer(
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: currentPage == index
                              ? Colors.black
                              : Colors.black26,
                        ),
                        duration: const Duration(milliseconds: 250),
                        child: TextButton(
                          style: const ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(Size.zero),
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(0)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 850),
                              curve: Curves.decelerate,
                            );
                          },
                          child: Container(
                            width: 24,
                            height: 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(128),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      currentPage == 0
                          ? Container()
                          : TextButton(
                              onPressed: () {
                                pageController.animateToPage(
                                  currentPage - 1,
                                  duration: const Duration(milliseconds: 850),
                                  curve: Curves.decelerate,
                                );
                              },
                              child: const Text(
                                'back',
                                style: TextProperties.smallThick,
                              ),
                            ),
                      currentPage == onboardingPages.length - 1
                          ? TextButton(
                              onPressed: () {
                                finishOnboard();
                              },
                              child: const Text(
                                'finish',
                                style: TextProperties.smallThick,
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                pageController.animateToPage(
                                  currentPage + 1,
                                  duration: const Duration(milliseconds: 850),
                                  curve: Curves.decelerate,
                                );
                              },
                              child: const Text(
                                'next',
                                style: TextProperties.smallThick,
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
