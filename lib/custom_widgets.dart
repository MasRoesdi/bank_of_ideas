import 'package:bank_of_ideas/custom_properties.dart';
import 'package:bank_of_ideas/ideas.dart';
import 'package:flutter/material.dart';

class CardIdea extends StatelessWidget {
  final String? title;
  final String? description;
  final List? categories;
  final String? content;

  const CardIdea(
      {required this.title,
      required this.description,
      required this.categories,
      required this.content,
      super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IdeaScreen(
              title: title,
              description: description,
              categories: categories,
              content: content,
            ),
          ),
        );
      },
      child: Container(
        width: screenSize.width * 0.95,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 18,
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: ColorProperties.main,
          borderRadius: BorderRadius.circular(4),
          boxShadow: BoxShadowProperties.cardShadow,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title',
              style: TextProperties.h1,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '$description',
              style: TextProperties.normal,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '$categories',
              style: TextProperties.normal,
            ),
          ],
        ),
      ),
    );
  }
}

class ColorProcessor {
  // Modifies the current color using the HSLColor class to modify the color's
  // lightness/brightness. It is considerably easier to use HSL than RGB. Since
  // using RGB means that you need to handle values that could go over 255.
  static Color modifiedCategoryColor(Color currentColor) {
    HSLColor convertedColor = HSLColor.fromColor(currentColor);
    double colorBrightness = convertedColor.lightness;

    if (colorBrightness < 0.5) {
      return convertedColor
          .withLightness(convertedColor.lightness + 0.2)
          .toColor();
    } else {
      return convertedColor
          .withLightness(convertedColor.lightness - 0.2)
          .toColor();
    }
  }
}

// This widget is used for the HomeScreen's toggle buttons. The widget requires
// the color code, name of said category, and the state to know whether or not
// the button has been pressed.
class CategoryToggleButton extends StatelessWidget {
  final Color? categoryColor;
  final String? categoryName;
  final VoidCallback buttonPressed;
  final bool? isSelected;

  const CategoryToggleButton(
      {required this.categoryColor,
      required this.categoryName,
      required this.buttonPressed,
      required this.isSelected,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(256),
              ),
            ),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: buttonPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected! ? categoryColor! : ColorProperties.secondary,
            border: Border.all(
              color: categoryColor!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(256),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: isSelected!
                      ? ColorProcessor.modifiedCategoryColor(categoryColor!)
                      : categoryColor,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                '$categoryName',
                style: TextStyle(
                  color: isSelected! &&
                          HSLColor.fromColor(categoryColor!).lightness < 0.5
                      ? ColorProperties.main
                      : Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Page template for onboarding
class OnboardPage extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? imagePath;

  const OnboardPage(
      {required this.title,
      required this.subtitle,
      required this.imagePath,
      super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.65,
      decoration: BoxDecoration(
        color: ColorProperties.main,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: screenSize.width,
              child: Image.asset(
                imagePath!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            '$title',
            style: TextProperties.h1,
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '$subtitle',
              style: TextProperties.normal,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final VoidCallback buttonPressed;
  final Color categoryColor;
  final String categoryName;

  const CategoryButton(
      {required this.buttonPressed,
      required this.categoryColor,
      required this.categoryName,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(256),
            ),
          ),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: buttonPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
          color: categoryColor,
          borderRadius: BorderRadius.circular(256),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                color: ColorProcessor.modifiedCategoryColor(categoryColor),
                shape: BoxShape.circle,
              ),
            ),
            Text(
              categoryName,
              style: TextStyle(
                color: HSLColor.fromColor(categoryColor).lightness < 0.5
                    ? ColorProperties.main
                    : Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
