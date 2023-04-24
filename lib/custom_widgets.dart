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
      decoration: BoxDecoration(
        color: Colors.yellow[400],
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
          Text(
            '$description',
            style: TextProperties.normal,
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

// This widget is used for the HomeScreen's toggle buttons
// The widget requires the color code and the name of said category
class CategoryButton extends StatelessWidget {
  final Color? categoryColor;
  final String? categoryName;
  final bool? isSelected;

  const CategoryButton(
      {required this.categoryColor,
      required this.categoryName,
      required this.isSelected,
      super.key});

  // This part of the code is still errornous, mainly because the r, g, and b
  // values can exceed 255 (which may have unexpected effects).
  // ------------------------------------------------------------------------
  // TODO: IMPLEMENT ERROR HANDLING ON COLORS THAT MAY EXCEED 255 IN RGB VALUE
  Color modifiedCategoryColor(Color currentColor) {
    return currentColor
        .withRed(currentColor.red + 14)
        .withGreen(currentColor.green + 14)
        .withBlue(currentColor.blue + 14);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected! ? categoryColor! : Colors.grey[100],
        border: Border.all(
          color: categoryColor!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(48),
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
            style: TextProperties.small,
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
