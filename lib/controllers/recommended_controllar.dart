
import 'package:food_delivery/data/repo/popular_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

import '../data/repo/recommeded_product_repo.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController(this.recommendedProductRepo);
  List<dynamic> _recommendedProductList=[];
  List<dynamic> get recommendedProductList=> _recommendedProductList;
  bool _isLoaded = false ;
  bool get isLoaded =>  _isLoaded;
  Future<void> getRecommendedProductList()async{
    Response response= await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200)
    {
      print('success');
      //print(response.body);
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products as Iterable );
      _isLoaded = true;
      update();

    }
    else{
      print("failll");
      print(response.statusText);

    }
  }
}
