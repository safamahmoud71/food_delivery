import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_controllar.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/routes.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:food_delivery/utils/styles.dart';
import 'package:food_delivery/view/food_details/weidgets/expandable_text.dart';
import 'package:food_delivery/view/food_details/weidgets/icon_app.dart';
import 'package:get/get.dart';

import '../../utils/constant.dart';
import '../cart/cart_page.dart';

class RecommendedFoodDetails extends StatelessWidget {
   RecommendedFoodDetails({super.key, required this.index});
   var index;
  @override
  Widget build(BuildContext context) {
    var parsedIndex = int.parse(index);

    var recommendedProduct= Get.find<RecommendedProductController>().recommendedProductList[parsedIndex];
    Get.find<PopularProductController>().initQuantity(recommendedProduct, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: SizeConfig.verticalBlock * 100,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.initial);
                    },
                    child: const IconApp(
                      icon: Icons.clear,
                    )),
                // const IconApp(
                //   icon: Icons.shopping_cart,
                // ),
                GetBuilder<PopularProductController>(builder: (product) {
                  return GestureDetector(
                    onTap: (){
                      Get.to(()=>const CartPage());
                    },
                    child: Stack(
                      children: [
                        const IconApp(icon: Icons.shopping_cart),

                        product.totalItems>=1? Positioned(
                          top:0,right:  0,
                          child: Container(
                            width: SizeConfig.horizontalBlock*15,

                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular( SizeConfig.horizontalBlock*15/2)
                            ),
                            child: Center(
                              child: Text('${product.totalItems}', style: TextStyles.textStyle12.copyWith(
                                  color: AppColors.white
                              ),),
                            ),


                          ),
                        ):Container()
                      ],
                    ),
                  );
                }),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                  padding: EdgeInsets.all(SizeConfig.horizontalBlock * 10),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight:
                            Radius.circular(SizeConfig.horizontalBlock * 25),
                        topLeft:
                            Radius.circular(SizeConfig.horizontalBlock * 25),
                      )),
                  child:  Center(
                      child: Text(
                        recommendedProduct.name,
                    style: TextStyles.textStyle20,
                  ))),
            ),
            backgroundColor: AppColors.yellow,
            pinned: true,
            expandedHeight: SizeConfig.verticalBlock * 300,
            flexibleSpace: FlexibleSpaceBar(
              background:Image.network("${AppConstant.baseUrl}/uploads/${recommendedProduct.img!}")
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.horizontalBlock * 15,
                  right: SizeConfig.horizontalBlock * 15),
              child: ExpandableText(
                text:
                  recommendedProduct.description!,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (productController){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      productController.setQuantity(false);
                    },
                    child: const IconApp(
                      icon: Icons.remove,
                      backgroundColor: AppColors.mainColor,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.horizontalBlock * 20,
                  ),
                  Text("\$ ${recommendedProduct.price}" " X" ' ${productController.cartItems}',
                      style:
                      TextStyles.textStyle18.copyWith(color: Colors.black87)),
                  SizedBox(
                    width: SizeConfig.horizontalBlock * 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      productController.setQuantity(true);
                    },
                    child: const IconApp(
                      icon: Icons.add,
                      backgroundColor: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.verticalBlock * 8,
              ),
              Container(
                padding: EdgeInsets.only(
                  top: SizeConfig.horizontalBlock * 30,
                  bottom: SizeConfig.horizontalBlock * 30,
                  left: SizeConfig.horizontalBlock * 20,
                  right: SizeConfig.horizontalBlock * 20,
                ),
                height: SizeConfig.verticalBlock * 120,
                decoration: BoxDecoration(
                    color: AppColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(SizeConfig.horizontalBlock * 30),
                      topLeft: Radius.circular(SizeConfig.horizontalBlock * 30),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.all(SizeConfig.horizontalBlock * 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              SizeConfig.horizontalBlock * 20),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: AppColors.mainColor,
                        )),
                    GestureDetector(
                      onTap: (){
                        productController.addItem(recommendedProduct);
                      },
                      child: Container(
                        height: 100,
                        padding: EdgeInsets.all(SizeConfig.horizontalBlock * 15),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius:
                          BorderRadius.circular(SizeConfig.horizontalBlock * 20),
                        ),
                        child: Text(
                          '\$ ${recommendedProduct.price} | Add to cart',
                          style: TextStyles.textStyle18.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      )
    );
  }
}
