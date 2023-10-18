import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/constant.dart';
import 'package:food_delivery/utils/styles.dart';
import 'package:food_delivery/view/home/weidgts/text_icon.dart';

import '../../../utils/size_config.dart';


class BuildPageItem extends StatelessWidget {
  const BuildPageItem({
    super.key,
    required double currPage,
    required double scaleFactor,
    required int height,
    required this.index, required this.popularProduct,
  }) : _currPage = currPage, _scaleFactor = scaleFactor, _height = height;

  final double _currPage;
   final ProductModel popularProduct;
  final double _scaleFactor;
  final int _height;
  final int index;

  @override
  Widget build(BuildContext context) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPage.floor()) {
      var currScale = 1 - (_currPage - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    else if (index == _currPage.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPage - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    else if (index == _currPage.floor() - 1) {
      var currScale = 1 - (_currPage - index) * (1 - _scaleFactor);

      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: SizeConfig.verticalBlock * 220,
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(SizeConfig.horizontalBlock*30),
                image:  DecorationImage(
                    image: NetworkImage("${AppConstant.baseUrl}/uploads/${popularProduct.img!}"),
                    fit: BoxFit.fill)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin:  EdgeInsets.only(left: SizeConfig.horizontalBlock*15, right: SizeConfig.horizontalBlock*15),
              height: SizeConfig.verticalBlock * 150,
              width: SizeConfig.horizontalBlock * 340,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    blurRadius: 5,
                    offset: Offset(5, 5),
                  ),
                ],
                color: AppColors.white,
                borderRadius: BorderRadius.circular(SizeConfig.horizontalBlock*20),
              ),
              child: Padding(
                padding:  EdgeInsets.all(SizeConfig.horizontalBlock*15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      popularProduct.name!,
                      style: TextStyles.textStyle20
                          .copyWith(color: AppColors.textColor1),
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
                          style: TextStyles.textStyle12
                              .copyWith(color: AppColors.textColor2),
                        ),
                        SizedBox(
                          width: SizeConfig.horizontalBlock * 8,
                        ),
                        Text(
                          '1287 comments',
                          style: TextStyles.textStyle12
                              .copyWith(color: AppColors.textColor2),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconsAndTexts(
                          icon: Icons.circle,
                          iconColor: AppColors.iconColor1,
                          text: 'Normal',
                          iconSize: SizeConfig.horizontalBlock*25,
                          textColor: AppColors.textColor2,
                        ),
                        IconsAndTexts(
                          icon: Icons.location_pin,
                          iconColor: AppColors.mainColor,
                          text: '1.7Km',
                          iconSize: SizeConfig.horizontalBlock*25,
                          textColor: AppColors.textColor2,
                        ),
                        IconsAndTexts(
                          icon: Icons.watch_later_outlined,
                          iconColor: AppColors.red,
                          text: '32min',
                          iconSize: SizeConfig.horizontalBlock*25,
                          textColor: AppColors.textColor2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}