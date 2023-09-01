import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:online_shopee/controllers/cart_controller.dart';
import 'package:online_shopee/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  //controllers are based on functionality not on views
  // we can also use dependency injection
  final shoppingController = Get.put(ShoppingController());
  // final shoppingController = ShoppingController();
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              //we need to make the list view always listen to the data from the controller
              //for this we will wrap it in a stram builder
              child: GetX<ShoppingController>(
                  //output which it gives is the controller
                  builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          '${controller.products[index].productDescription}'),
                                    ],
                                  ),
                                  Text('\$${controller.products[index].price}',
                                      style: TextStyle(fontSize: 24)),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  onPrimary: Colors.white,
                                ),
                                child: const Text('Add to Cart'),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return  Text(
                'Total Amount: \$ ${controller.totalPrice}',
                style: TextStyle(fontSize: 32, color: Colors.black),
              );
            }),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
