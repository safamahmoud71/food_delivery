import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_controllar.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repo/cart_rep.dart';
import 'package:food_delivery/data/repo/popular_product_repo.dart';
import 'package:food_delivery/data/repo/recommeded_product_repo.dart';
import 'package:food_delivery/utils/constant.dart';
import 'package:get/get.dart';

Future<void> init ()async{
 Get.lazyPut(()=>ApiClient(baseUrl: AppConstant.baseUrl));
 Get.lazyPut(() => PopularProductRepo( apiClient: Get.find() ));
 Get.lazyPut(() => PopularProductController( Get.find()));
 Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
 Get.lazyPut(() => RecommendedProductController(Get.find()));
 Get.lazyPut(()=>CartRepo());
 Get.lazyPut(() => CartController( Get.find()));
}