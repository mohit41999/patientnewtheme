import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:patient/Utils/colorsandstyles.dart';
import 'package:patient/controller/NavigationController.dart';

class commonRow extends StatelessWidget {
  final String Title;
  final String subTitle;
  final dynamic value;

  const commonRow({
    Key? key,
    required this.Title,
    required this.subTitle,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Title,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold, fontSize: 20, color: appblackColor),
        ),
        GestureDetector(
          onTap: () {
            Push(context, value);
          },
          child: Row(
            children: [
              Text(
                subTitle,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    color: appblackColor),
              ),
              Icon(
                Icons.arrow_forward,
                color: appblackColor,
                size: 14,
              )
            ],
          ),
        )
      ],
    );
  }
}
