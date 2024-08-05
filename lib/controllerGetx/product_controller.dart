import 'package:assignment/api_service.dart';
import 'package:assignment/mode/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;
  var selectedProduct = Rxn<Product>();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var response = await ApiService().fetchProducts();
      products.addAll(response.products as Iterable<Product>);
    } finally {
      isLoading(false);
    }
  }

  void selectProduct(Product product) {
    selectedProduct.value = product;
    Get.toNamed('/details');
  }
}
