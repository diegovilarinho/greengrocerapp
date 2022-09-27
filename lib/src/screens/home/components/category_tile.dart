import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class CategoryTile extends StatelessWidget {
  final String categoryName;
  final bool isSelected;
  final VoidCallback onPressed;

  const CategoryTile(
      {Key? key,
      required this.categoryName,
      required this.isSelected,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
          decoration: BoxDecoration(
              color: isSelected
                  ? CustomColors.customSwatchColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8)),
          child: Text(categoryName,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : CustomColors.customContrastColor,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
