import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:food_delivery/utils/styles.dart';
import 'package:food_delivery/view/food_details/weidgets/icon_app.dart';
import 'package:get/get.dart';

import '../../utils/constant.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: SizeConfig.horizontalBlock * 60,
              right: SizeConfig.horizontalBlock * 20,
              left: SizeConfig.horizontalBlock * 20,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconApp(
                    icon: Icons.arrow_back_ios_new,
                    iconColor: AppColors.white,
                    backgroundColor: AppColors.mainColor,
                  ),
                  IconApp(
                    icon: Icons.home,
                    iconColor: AppColors.white,
                    backgroundColor: AppColors.mainColor,
                  ),
                  IconApp(
                    icon: Icons.shopping_cart,
                    iconColor: AppColors.white,
                    backgroundColor: AppColors.mainColor,
                  )
                ],
              )),
          Positioned(
              top: SizeConfig.horizontalBlock * 100,
              right: SizeConfig.horizontalBlock * 20,
              left: SizeConfig.horizontalBlock * 20,
              child: SizedBox(
                height: 800,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(
                    builder: (cartController){
                      return ListView.builder(
                          itemCount: cartController.getCartItems.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(
                                bottom: SizeConfig.horizontalBlock * 8.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: SizeConfig.verticalBlock * 120,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: SizeConfig.horizontalBlock * 100,
                                    height: SizeConfig.verticalBlock * 120,
                                    decoration: BoxDecoration(
                                        image:  DecorationImage(
                                            image:NetworkImage(
                                                '${AppConstant.baseUrl}/uploads/${cartController.getCartItems[index].img!}'

                                            ),
                                            fit: BoxFit.cover),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            SizeConfig.horizontalBlock * 20)),
                                  ),
                                  SizedBox(width: SizeConfig.horizontalBlock*5,),
                                  Expanded(
                                      child: SizedBox(
                                        height: SizeConfig.verticalBlock * 120,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${cartController.getCartItems[index].name}',
                                              style: TextStyles.textStyle20.copyWith(
                                                  color: AppColors.textColor1
                                              ),
                                            ),
                                            SizedBox(
                                              height: SizeConfig.verticalBlock * 8,
                                            ),
                                             Text(
                                               '${cartController.getCartItems[index].name}',
                                              style: TextStyles.textStyle12,
                                            ),
                                            SizedBox(
                                              height: SizeConfig.verticalBlock * 8,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '\$ "${cartController.getCartItems[index].price}"',
                                                  style: TextStyles.textStyle18.copyWith(
                                                      color: AppColors.red
                                                  ),
                                                ),
                                                const Spacer(),
                                                const Icon(
                                                  Icons.remove,
                                                  color: AppColors.signColor,
                                                ),
                                                Text(
                                                  '${cartController.getCartItems[index].quantity}',
                                                  style: TextStyles.textStyle18.copyWith(
                                                      color: AppColors.textColor1
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.add,
                                                  color: AppColors.signColor,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ));
                    },
                  )
                ),
              ))
        ],
      ),
    );
  }
}
