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
    // TODO: implement onInit
    super.onInit();
    addItemToFeaturedProductList();
  }

  void addItemToFeaturedProductList() {
    // find difference between addAll and assignAll
    featuredProductList.assignAll(productList);
  }

  // show data in detail page using getx

  void addToCart(ProductModel product) {
    // add data to productCartList
    // show snackbar using getx "product added successfully"
    //use productCartList.assign() to add data
    productCartList.add(product);
    Get.showSnackbar(
      GetSnackBar(
        message: 'Product added to cart.',
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void deleteItemFromCart(ProductModel product) {
    // remove item from productCartList
  }

  // 1. call this in initstate of shopping cart screen
  // 2. + and - button in shopping cart screen
  // 3. delete button in shopping cart screen
  void calculateTotalPrice() {
    // sum of each product price * quantity
  }

  void decrease(ProductModel product) {}

  void increase(ProductModel product) {}

  void deleteFromfavourite(product) {}

  void removeFromFavourite(ProductModel product) {}
}
