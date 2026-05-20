import 'package:figmaproject/product_list.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<ProductModel> featuredProductList = <ProductModel>[].obs;
  RxList<ProductModel> productCartList = <ProductModel>[].obs;
  RxList<ProductModel> vegetablesPageList = <ProductModel>[].obs;

  Rxn<ProductModel> selectedProduct = Rxn();

  get favouriteList => null;

  get shippingAddress => null;

  ValueChanged<bool>? get toggleShippingAddress => null;
  @override
  void onInit() {
 
    super.onInit();
    addItemToFeaturedProductList();
  }

  void addItemToFeaturedProductList() {
   
    featuredProductList.assignAll(productList);
  }

  

  void addToCart(ProductModel product) {
    
    productCartList.add(product);
    Get.showSnackbar(
      GetSnackBar(
        message: 'Product added to cart.',
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void deleteItemFromCart(ProductModel product) {
    
  }

 
  void calculateTotalPrice() {
    
  }

  void decrease(ProductModel product) {}

  void increase(ProductModel product) {}

  void deleteFromfavourite(product) {}

  void removeFromFavourite(ProductModel product) {}
}
