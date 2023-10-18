import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/styles.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text('Bangladesh',
                style: TextStyles.textStyle18
                    .copyWith(color: AppColors.mainColor)),
            Row(
              children: [
                Text(
                  'city',
                  style: TextStyles.textStyle12
                      .copyWith(color: AppColors.textColor2),
                ),
                const Icon(Icons.arrow_drop_down_outlined),
              ],
            ),
          ],
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(
            Icons.search,
            color: AppColors.white,
          ),
        )
      ],
    );
  }
}