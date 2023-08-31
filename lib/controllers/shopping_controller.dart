import 'package:get/state_manager.dart';
import 'package:online_shopee/models/product.dart';

class ShoppingController extends GetxController {
  //creation of observable items that update itself on api calls
  var products = <Product>[].obs;

  @override
  void onInit() {
    //here you can call apis 
    super.onInit();
    fetchProduucts();
  }

  void fetchProduucts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
        id: 1,
        price: 30,
        productName: 'FirstProd',
        productImage: 'bsvksbl',
        productDescription: 'this is product description',
      ),
      Product(
        id: 2,
        price: 40,
        productName: 'SecProd',
        productImage: 'abd',
        productDescription: 'this is product description',
      ),
      Product(
        id: 3,
        price: 50,
        productName: 'thirdProd',
        productImage: 'abd',
        productDescription: 'this is product description',
      ),
    ];
    products.value  = productResult;
  }
}
