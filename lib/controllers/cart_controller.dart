import 'package:food_delivery/data/repo/cart_rep.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController(this.cartRepo);
  Map<int, CartModel> cartItems = {};
  Map<int, CartModel> get itemsForCart => cartItems;
  void addItemToCart(ProductModel productModel, int quantity) {
    var totalQuantity = 0;
    if (cartItems.containsKey(productModel.id)) {
      cartItems.update(productModel.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          name: value.name,
          price: value.price,
          id: value.id,
          img: value.img,
          isExited: true,
          quantity: value.quantity! + quantity,
          time: DateTime.now().toString(),
        );
      });
      if (totalQuantity <= 0) {
        cartItems.remove(productModel.id);
      }
    } else {
      if (quantity > 0) {
        cartItems.putIfAbsent(productModel.id!, () {
          print('added to cart $quantity');
          print("there is in the cart ${cartItems.length}");
          return CartModel(
            name: productModel.name,
            price: productModel.price,
            id: productModel.id,
            img: productModel.img,
            isExited: true,
            quantity: quantity,
            time: DateTime.now().toString(),
          );
        });
      } else {
        Get.snackbar("item count, ", "You should add at lea  st one item! ",
            backgroundColor: AppColors.mainColor,
            colorText: AppColors.white,
            borderRadius: 15);
      }
      // update();
    }
  }

  bool isExist(ProductModel productModel) {
    if (cartItems.containsKey(productModel.id)) {
      return true;
    }

    return false;
  }

  int getQuantity(ProductModel productModel) {
    var quantity = 0;
    if (cartItems.containsKey(productModel.id)) {
      cartItems.forEach((key, value) {
        if (key == productModel.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    int totalQuantity = 0;
    cartItems.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getCartItems {
    return cartItems.entries.map((e) {
      return e.value;
    }).toList();
  }
}
