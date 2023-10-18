import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:food_delivery/utils/styles.dart';
import 'package:food_delivery/view/home/weidgts/text_icon.dart';
class AppColumn extends StatelessWidget {
  const AppColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Chinese side',
          style: TextStyles.textStyle20.copyWith(color: AppColors.textColor1),
        ),
        SizedBox(
          height: SizeConfig.verticalBlock * 15,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    color: AppColors.mainColor,
                    size: SizeConfig.horizontalBlock * 15,
                  )),
            ),
            SizedBox(
              width: SizeConfig.horizontalBlock * 8,
            ),
            Text(
              '4.8',
              style:
              TextStyles.textStyle12.copyWith(color: AppColors.textColor2),
            ),
            SizedBox(
              width: SizeConfig.horizontalBlock * 8,
            ),
            Text(
              '1287 comments',
              style:
              TextStyles.textStyle12.copyWith(color: AppColors.textColor2),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.verticalBlock * 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconsAndTexts(
              icon: Icons.circle,
              iconColor: AppColors.iconColor1,
              text: 'Normal',
              iconSize: SizeConfig.horizontalBlock * 25,
              textColor: AppColors.textColor2,
            ),
            IconsAndTexts(
              icon: Icons.location_pin,
              iconColor: AppColors.mainColor,
              text: '1.7Km',
              iconSize: SizeConfig.horizontalBlock * 25,
              textColor: AppColors.textColor2,
            ),
            IconsAndTexts(
              icon: Icons.watch_later_outlined,
              iconColor: AppColors.red,
              text: '32min',
              iconSize: SizeConfig.horizontalBlock * 25,
              textColor: AppColors.textColor2,
            ),
          ],
        )
      ],
    );
  }
}