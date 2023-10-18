import 'package:food_delivery/view/cart/cart_page.dart';
import 'package:food_delivery/view/food_details/food_popular.dart';
import 'package:food_delivery/view/food_details/food_recommended.dart';
import 'package:food_delivery/view/home/main_food_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initial = "/";
  static const popularFood = '/popularFood';
  static const recommendedFood = '/recommendedFood';
  static const cartPage = '/cartPage';

  static String getInitial() => initial;
  static String getCartPage() => cartPage;

  static String getPopularFood(var index) => '$popularFood?index= $index';
  static String getRecommendedFood(var index) =>
      '$recommendedFood?index= $index';
  static List<GetPage> routes = [
    GetPage(name: '/', page: () => const MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var index = Get.parameters['index'];
          return PopularFoodDetails(index: index);
        }),
    GetPage(
        name: recommendedFood,
        page: () {
          var index = Get.parameters['index'];
          return RecommendedFoodDetails(index: index);
        }),
    GetPage(
        name: cartPage,
        page: () {
          return const CartPage();
        })
  ];
}
