import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_controllar.dart';
import 'package:food_delivery/utils/routes.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:food_delivery/view/cart/cart_page.dart';

import 'package:get/get.dart';

import 'helper/dependencies.dart' as dep;





Future<void> main() async {
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    Get.find<CartController>();

    SizeConfig().init(context);
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,

     initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    //  home: CartPage(),

    );
  }
}


