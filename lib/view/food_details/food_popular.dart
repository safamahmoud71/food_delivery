import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/constant.dart';
import 'package:food_delivery/utils/routes.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:food_delivery/utils/styles.dart';
import 'package:food_delivery/view/cart/cart_page.dart';
import 'package:get/get.dart';

import 'weidgets/app_column.dart';
import 'weidgets/expandable_text.dart';
import 'weidgets/icon_app.dart';

class PopularFoodDetails extends StatelessWidget {
  PopularFoodDetails({super.key, required this.index});
  var index;
  @override
  Widget build(BuildContext context) {
    var parsedIndex = int.parse(index);
    var popularProduct =
        Get.find<PopularProductController>().popularProductList[parsedIndex];
    Get.find<PopularProductController>()
        .initQuantity(popularProduct, Get.find<CartController>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: SizeConfig.verticalBlock * 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "${AppConstant.baseUrl}/uploads/${popularProduct.img!}"))),
                )),
            Positioned(
                top: SizeConfig.verticalBlock * 45,
                left: SizeConfig.horizontalBlock * 20,
                right: SizeConfig.horizontalBlock * 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.initial);
                        },
                        child: const IconApp(icon: Icons.arrow_back_ios_new)),
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
                )),
            Positioned(
                top: SizeConfig.verticalBlock * 330,
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                      left: SizeConfig.horizontalBlock * 20,
                      right: SizeConfig.horizontalBlock * 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(SizeConfig.horizontalBlock * 25),
                          topRight: Radius.circular(
                              SizeConfig.horizontalBlock * 25))),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.verticalBlock * 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppColumn(),
                        SizedBox(
                          height: SizeConfig.verticalBlock * 25,
                        ),
                        const Text(
                          'Introduce',
                          style: TextStyles.textStyle18,
                        ),
                        SizedBox(
                          height: SizeConfig.verticalBlock * 25,
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                                child:
                                    ExpandableText(text: popularProduct.name)))
                      ],
                    ),
                  ),
                )),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (quantityContr) {
            return Container(
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
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            quantityContr.setQuantity(false);
                          },
                          child: const Icon(
                            Icons.remove,
                            color: AppColors.signColor,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.horizontalBlock * 5,
                        ),
                        Text(
                          '${quantityContr.cartItems}',
                          style: TextStyles.textStyle20,
                        ),
                        SizedBox(
                          width: SizeConfig.horizontalBlock * 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            quantityContr.setQuantity(true);
                          },
                          child: const Icon(
                            Icons.add,
                            color: AppColors.signColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: EdgeInsets.all(SizeConfig.horizontalBlock * 15),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(
                          SizeConfig.horizontalBlock * 20),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        quantityContr.addItem(popularProduct);
                      },
                      child: Text(
                        '\$ ${popularProduct.price!} | Add to cart',
                        style: TextStyles.textStyle18
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
