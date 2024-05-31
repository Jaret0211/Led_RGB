import 'package:app_lampara/view/smart_light_view_model.dart';
import 'package:flutter/material.dart';

//Punto de color
class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.isSelected,
    required this.dotColor,
    required this.index,
    required this.model,
  }) : super(key: key);

  final bool isSelected;
  final Color dotColor;
  final int index;
  final SmartLightViewModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        model.changeColor(currentIndex: index);
      },
      child: Container(
        height: 22,
        width: 22,
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? dotColor : Color.fromARGB(255, 255, 255, 255),
          border: Border.all(
            color: dotColor,
            width: 3,
          ),
        ),
      ),
    );
  }
}
