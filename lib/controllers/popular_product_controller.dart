import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repo/popular_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';

class PopularProductController extends GetxController {
  PopularProductController(this.popularProductRepo);

  final PopularProductRepo popularProductRepo;
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _cartItems = 0;
  int _quantity = 0;
  int get quantity => _quantity;
  late CartController _cartController;
  int get cartItems => _cartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      //print(response.body);
      _popularProductList = [];
      _popularProductList
          .addAll(Product.fromJson(response.body).products as Iterable);

      _isLoaded = true;
      update();
    } else {
      print(response.statusText);
      print("fail");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);

        } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (_cartItems+quantity > 20) {
      Get.snackbar("item count, ", "Sorry! you can’t take more than 20 item",
          backgroundColor: AppColors.mainColor,
          colorText: AppColors.white,
          borderRadius: 15);
      return 20;
    } else if (_cartItems+quantity < 0) {
      Get.snackbar("item count, ", "Sorry! you can’t reduce more ",
          backgroundColor: AppColors.mainColor,
          colorText: AppColors.white,
          borderRadius: 15);
      if(_cartItems>0)
        {
          quantity -=_cartItems;

          return quantity;
        }
      return 0;
    }
    else
      {
        return quantity;
      }


  }

  void initQuantity(ProductModel productModel, CartController cartController) {
    _quantity = 0;
    _cartItems = 0;

    _cartController = cartController;
    bool isExist = false;

    isExist = _cartController.isExist(productModel);
    print('exist or not $isExist');
    if (isExist) {
      _cartItems = _cartController.getQuantity(productModel);
    }
    print('the quantity in the cart is $_cartItems');
  }

  void addItem(ProductModel product) {

      _cartController.addItemToCart(product, _quantity);
      _quantity = 0;
      _cartItems = _cartController.getQuantity(product);
      _cartController.cartItems.forEach((key, value) {
        print("there is ${value.id} card num and ${value.quantity}quantity ");
      });
      update();

  }

  int get totalItems{

    return _cartController.totalItems;

  }
  List<CartModel> get getCartItems{
   return _cartController.getCartItems;
  }
}
