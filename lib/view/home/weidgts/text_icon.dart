import 'package:flutter/material.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:food_delivery/utils/styles.dart';



class IconsAndTexts extends StatelessWidget {
  const IconsAndTexts(
      {super.key,
        required this.textColor,
        required this.text,
        required this.icon,
        required this.iconColor,
        required this.iconSize});
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color textColor;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        SizedBox(
          width: SizeConfig.horizontalBlock * 5,
        ),
        Text(

          text,
          style: TextStyles.textStyle12.copyWith(color: textColor),
          overflow: TextOverflow.clip,


        )
      ],
    );
  }
}