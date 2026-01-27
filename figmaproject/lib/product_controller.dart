import 'package:get/get.dart';
import 'product_list.dart';

class ProductController extends GetxController {
  // All products
  RxList<ProductModel> allProducts = <ProductModel>[].obs;

  // Featured products
  RxList<ProductModel> featuredProductList = <ProductModel>[].obs;

  // Cart
  RxList<ProductModel> cartList = <ProductModel>[].obs;

  // Selected product
  Rx<ProductModel?> selectedProduct = Rx<ProductModel?>(null);

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  // ✅ Load products
  void loadProducts() {
    allProducts.assignAll(productList); // from product_list.dart
    featuredProductList.assignAll(allProducts);
  }

  // ✅ Add to cart (USED BY DETAIL + HOME)
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
        ),
      );
    }

    cartList.refresh();
  }

  // ➕ Increase quantity
  void increase(ProductModel product) {
    product.quantity.value++;
    cartList.refresh();
  }

  // ➖ Decrease quantity
  void decrease(ProductModel product) {
    if (product.quantity.value > 1) {
      product.quantity.value--;
      cartList.refresh();
    } else {
      print('a');
    }
  }

  // 🗑 Remove item
  void deleteFromCart(ProductModel product) {
    cartList.remove(product);
  }

  // 💰 Total price
  double calculateTotalPrice() {
    return cartList.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity.value),
    );
  }
}
