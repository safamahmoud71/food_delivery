import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_controllar.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/constant.dart';
import 'package:food_delivery/utils/routes.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:food_delivery/utils/styles.dart';
import 'package:get/get.dart';
import 'build_page_item.dart';
import 'text_icon.dart';

class PageViewSection extends StatefulWidget {
  const PageViewSection({super.key});

  @override
  State<PageViewSection> createState() => _PageViewSectionState();
}

class _PageViewSectionState extends State<PageViewSection> {
  final PageController pageController = PageController(viewportFraction: 0.87);
  var _currPage = 0.0;
  final _scaleFactor = 0.8;
  final _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<PopularProductController>(
              builder:(popularProducts) {
                return popularProducts.isLoaded? Container(
                  margin: EdgeInsets.only(top: SizeConfig.horizontalBlock * 15),
                  height: SizeConfig.verticalBlock * 320,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length ,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.getPopularFood(index));
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.horizontalBlock * 10,
                                  right: SizeConfig.horizontalBlock * 10),
                              child: BuildPageItem(
                                  popularProduct: popularProducts.popularProductList[index],
                                  currPage: _currPage,
                                  scaleFactor: _scaleFactor,
                                  height: _height,
                                  index: index)),
                        );
                      }),
                ):
                const CircularProgressIndicator(color: AppColors.mainColor,)
                ;
              },

            ),
            SizedBox(
              height: SizeConfig.verticalBlock * 15,
            ),
            //DotsIndicator
            GetBuilder<PopularProductController>(builder:(popularProducts) {
              return DotsIndicator(
                dotsCount:  popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
                position: _currPage,
                decorator: DotsDecorator(
                  activeColor: AppColors.mainColor,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              );
            }),
            SizedBox(
              height: SizeConfig.verticalBlock * 30,
            ),
            Row(
              children: [
                const Text(
                  'Recommended',

                  style: TextStyles.textStyle18,
                ),
                SizedBox(
                  width: SizeConfig.horizontalBlock * 8,
                ),
                const Text('.', style: TextStyles.textStyle12),
                SizedBox(
                  width: SizeConfig.horizontalBlock * 8,
                ),
                const Text('Food Pairing', style: TextStyles.textStyle12),
              ],
            ),
            SizedBox(
              height: SizeConfig.verticalBlock * 15,
            ),
            GetBuilder<RecommendedProductController>(
              builder: (recommendedProduct){
                return recommendedProduct.recommendedProductList.isEmpty?const CircularProgressIndicator(
                  color: AppColors.mainColor,
                ): ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:recommendedProduct.recommendedProductList.isEmpty?1: recommendedProduct.recommendedProductList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.verticalBlock * 8,
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.getRecommendedFood(index) , );},
                          child: Row(
                            children: [
                              Container(
                                width: SizeConfig.horizontalBlock * 120,
                                height: SizeConfig.verticalBlock * 120,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.horizontalBlock * 15),
                                    image:  DecorationImage(
                                        image:NetworkImage("${AppConstant.baseUrl}/uploads/${recommendedProduct.recommendedProductList[index].img!}"),
                                        fit: BoxFit.cover)),
                              ),
                              Expanded(
                                  child: Container(
                                    height: SizeConfig.verticalBlock * 100,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                              SizeConfig.horizontalBlock * 20),
                                          bottomRight: Radius.circular(
                                              SizeConfig.horizontalBlock * 20),
                                        )),

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            recommendedProduct.recommendedProductList[index].name!,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyles.textStyle18,
                                          ),
                                          SizedBox(
                                            height: SizeConfig.verticalBlock * 8,
                                          ),
                                          Text(
                                            recommendedProduct.recommendedProductList[index].description! ,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyles.textStyle12,
                                          ),
                                          SizedBox(
                                            height: SizeConfig.verticalBlock * 8,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconsAndTexts(
                                                icon: Icons.circle,
                                                iconColor: AppColors.iconColor1,
                                                text:  'normal',

                                                iconSize:
                                                SizeConfig.horizontalBlock * 25,
                                                textColor: AppColors.textColor2,
                                              ),
                                              IconsAndTexts(
                                                icon: Icons.location_pin,
                                                iconColor: AppColors.mainColor,
                                                text: '1.7Km',
                                                iconSize:
                                                SizeConfig.horizontalBlock * 25,
                                                textColor: AppColors.textColor2,
                                              ),
                                              IconsAndTexts(
                                                icon: Icons.watch_later_outlined,
                                                iconColor: AppColors.red,
                                                text: '32min',
                                                iconSize:
                                                SizeConfig.horizontalBlock * 25,
                                                textColor: AppColors.textColor2,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          )

                      ),
                    ));
              },

            ),
          ],
        ),
      ),
    );
  }
}
