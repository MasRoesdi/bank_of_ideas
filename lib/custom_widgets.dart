import 'package:bank_of_ideas/custom_properties.dart';
import 'package:flutter/material.dart';

class CardIdea extends StatelessWidget {
  final String? title;
  final String? description;
  final List? categories;

  const CardIdea(
      {required this.title,
      required this.description,
      required this.categories,
      super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.95,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 18,
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: ColorProperties.main,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 1),
            blurRadius: 4,
          )
        ],
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
    );
  }
}

// This widget is used for the HomeScreen's toggle buttons. The widget requires
// the color code, name of said category, and the state to know whether or not
// the button has been pressed.
class CategoryButton extends StatelessWidget {
  final Color? categoryColor;
  final String? categoryName;
  final bool? isSelected;

  const CategoryButton(
      {required this.categoryColor,
      required this.categoryName,
      required this.isSelected,
      super.key});

  // Modifies the current color using the HSLColor class to modify the color's
  // lightness/brightness. It is considerably easier to use HSL than RGB. Since
  // using RGB means that you need to handle values that could go over 255.
  Color modifiedCategoryColor(Color currentColor) {
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

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 12,
            height: 12,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              color: isSelected!
                  ? modifiedCategoryColor(categoryColor!)
                  : categoryColor,
              shape: BoxShape.circle,
            ),
          ),
          Text(
            '$categoryName',
            style: TextStyle(
              color: isSelected! &&
                      HSLColor.fromColor(categoryColor!).lightness < 0.5
                  ? Colors.grey[100]
                  : Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// The commented class below is an attempt to create a custom ToggleButtons
// that is made solely for the categories selector that is designed for
// the HomeScreen. Due to the probable difficulty of making such widget,
// the development for it has been stopped.

// class CategoryButtonGroup extends StatelessWidget {
//   final List<CategoryButton>? buttons;
//   final List<bool>? isSelected;

//   const CategoryButtonGroup(
//       {required this.buttons, required this.isSelected, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: List.generate(buttons!.length, (index) {
//         return Container(
//           margin: const EdgeInsets.symmetric(horizontal: 8),
//           child: TextButton(
//             style: const ButtonStyle(
//               padding: MaterialStatePropertyAll(EdgeInsets.zero),
//               shape: MaterialStatePropertyAll(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(48),
//                   ),
//                 ),
//               ),
//               tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//             ),
//             onPressed: () {},
//             child: buttons![index],
//           ),
//         );
//       }),
//     );
//   }
// }
