import 'package:figmaproject/Categories_Page.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'product_list.dart';

class ProductController extends GetxController {
  // Products
  RxList<ProductModel> allProducts = <ProductModel>[].obs;
  RxList<ProductModel> featuredProductList = <ProductModel>[].obs;

  // Categories
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;

  // Favourites 
  RxList<ProductModel> favouriteList = <ProductModel>[].obs;

  // Cart
  RxList<ProductModel> cartList = <ProductModel>[].obs;

  // Selected product
  Rx<ProductModel?> selectedProduct = Rx<ProductModel?>(null);
  

  get selectedCategory => null;

  @override
  void onInit() {
    super.onInit();

    loadProducts();
    loadFavourites();
    loadSaveAddress();

    categoryList.assignAll([
      CategoryModel(image: "assets/vegetables.png", name: "Vegetables"),
      CategoryModel(image: "assets/fruits.png", name: "Fruits"),
      CategoryModel(image: "assets/beverages.png", name: "Beverages"),
      CategoryModel(image: "assets/grocery.png", name: "Grocery"),
      CategoryModel(image: "assets/edibleoil.png", name: "Edible Oil"),
      CategoryModel(image: "assets/household.png", name: "Household"),
      CategoryModel(image: "assets/babycare.png", name: "Baby Care"),
    ]);
  }
  // Save Address Switch
  RxBool saveAddress = false.obs;

  // Toggle switch
  void toggleSaveAddress(bool value) async {
    saveAddress.value = value;

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('save_address', value);
  }

  // Load switch value
  Future<void> loadSaveAddress() async {
    final prefs = await SharedPreferences.getInstance();
    saveAddress.value = prefs.getBool('save_address') ?? false;
  }


  //  Load products
  void loadProducts() {
    allProducts.assignAll(productList);
    featuredProductList.assignAll(productList);
  }

  //  TOGGLE FAVOURITE
  void toggleFavourite(ProductModel product) {
    if (favouriteList.contains(product)) {
      favouriteList.remove(product);
    } else {
      favouriteList.add(product);
    }
    saveFavourites();
  }

  //  CHECK FAVOURITE
  bool isFavourite(ProductModel product) {
    return favouriteList.contains(product);
  }

  //  REMOVE FROM FAVOURITE
  void removeFromFavourite(ProductModel product) {
    favouriteList.remove(product);
    saveFavourites();
  }

  //  SAVE FAVOURITES
  Future<void> saveFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'favourites',
      favouriteList.map((e) => e.productName).toList(),
    );
  }

  // 🔁 LOAD FAVOURITES
  Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final favNames = prefs.getStringList('favourites') ?? [];

    favouriteList.assignAll(
      productList.where((p) => favNames.contains(p.productName)),
    );
  }

  //  CART (unchanged)
  void addToCart(ProductModel product, int qty) {
    final index = cartList.indexWhere(
      (p) => p.productName == product.productName,
    );

    if (index >= 0) {
      cartList[index].quantity.value += qty;
    } else {
      cartList.add(
        ProductModel(
          productImage: product.productImage,
          productName: product.productName,
          unit: product.unit,
          price: product.price,
          quantity: RxInt(qty),
          isFavourite: RxBool(false),
          isNew: product.isNew,
          istag: product.istag,
          description: product.description,
          rating: product.rating,
        ),
      );
    }
  }

  //  Increase quantity
  void increases(ProductModel product) {
    product.quantity.value++;
    cartList.refresh();
  }

  //  Decrease quantity
  void decreases(ProductModel product) {
    if (product.quantity.value > 1) {
      product.quantity.value--;
      cartList.refresh();
    } else {
      print('a');
    }
  }

  

  //  Remove item
  void deleteFromCart(ProductModel product) {
    cartList.remove(product);
  }

  // Total price
  double calculateTotalPrice() {
    return cartList.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity.value),
    );
  }
}
