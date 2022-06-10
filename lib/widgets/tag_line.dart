import 'package:flutter/material.dart';
import 'package:patient/Utils/colorsandstyles.dart';

class TagLine extends StatelessWidget {
  final bool fromhome;
  const TagLine({
    Key? key,
    this.fromhome = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Making ',
                style: TextStyle(
                    color: (fromhome)
                        ? appYellowColor
                        : appYellowColor.withOpacity(0.8),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
              Text(
                'HealthCare\nUnderstandable ',
                style: TextStyle(
                    color: (fromhome)
                        ? Colors.white
                        : appBlackColor.withOpacity(0.8),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: appYellowColor)],
                    letterSpacing: 1),
              ),
            ],
          )),
    );
  }
}
