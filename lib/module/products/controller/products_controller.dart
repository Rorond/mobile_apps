import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import '../view/products_view.dart';

class ProductsController extends GetxController {
  ProductsView? view;
  final qntyTrolly = RxInt(0);
  final orders = RxList<Widget>([]);
  final order = RxList<Product>([]);
  final products = RxList([]);
  final navBarHeight = RxDouble(60);
  final total = RxDouble(0);
  final totalBayar = RxDouble(0);
  final noImage = RxString(
      "https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png");

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  getProducts() async {
    try {
      String url = "https://apigenerator.dronahq.com/api/g7s7P925/TestAlan/";
      BaseOptions options = BaseOptions(
        baseUrl: url,
        connectTimeout: const Duration(milliseconds: 60000),
        receiveTimeout: const Duration(milliseconds: 30000),
      );

      Dio dio = Dio(options);

      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        products.value = response.data;
      } else {
        Get.snackbar(
          "Sorry",
          "You have nota data",
          backgroundColor: Colors.white,
          colorText: Colors.red,
        );
        return null;
      }
    } catch (e) {
      Get.snackbar(
        "Sorry",
        "Connection problem",
        backgroundColor: Colors.white,
        colorText: Colors.red,
      );
      return null;
    }
    return null;
  }

  doOrder(id, name, price, qnty, picture) {
    Product product = Product(
        id: RxString(id),
        name: RxString(name),
        price: RxDouble(double.parse(price)),
        quantity: RxInt(1),
        picture: RxString(picture));

    if (order.contains(product)) {
      Get.snackbar(
        "Sorry",
        "This product is already in trolly",
        backgroundColor: Colors.white,
        colorText: Colors.red,
      );
    } else {
      order.add(product);
    }

    total.value = 0;
    for (Product product in order) {
      total.value += product.price.value * product.quantity.value;
    }
    orders.value = [];
    for (var i = 0; i < order.length; i++) {
      orders.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0.5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage(
                    order[i].picture.value == null
                        ? noImage.value.toString()
                        : order[i].picture.value.toString(),
                  ),
                ),
                title: Text(order[i].name.value),
                subtitle: Text(order[i].price.value == null
                    ? 0.toString()
                    : "Rp. ${order[i].price.value}"),
                trailing: SizedBox(
                  width: 150.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          removeQnty(order[i].id.value);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 3.0),
                          textStyle: const TextStyle(fontSize: 12.0),
                          minimumSize: const Size(0, 20),
                        ),
                        child: const Icon(
                          Icons.remove,
                          size: 17,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(() {
                          return Text(
                            order[i].quantity.value.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          );
                        }),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          addQnty(order[i].id.value);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 3.0),
                          textStyle: const TextStyle(fontSize: 12.0),
                          minimumSize: const Size(0, 20),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  addTrolly() {
    qntyTrolly.value++;
  }

  addQnty(id) {
    Product product = order.firstWhere((element) => element.id.value == id);
    product.quantity.value++;
    total.value = 0;
    for (Product product in order) {
      total.value += product.price.value * product.quantity.value;
    }
  }

  removeQnty(id) {
    Product update = order.firstWhere((element) => element.id.value == id);
    if (update.quantity.value <= 1) {
      Get.snackbar(
        "Sorry",
        "This is minimum order",
        backgroundColor: Colors.white,
        colorText: Colors.red,
      );
    } else {
      update.quantity.value--;
      total.value = 0;
      for (Product product in order) {
        total.value += product.price.value * product.quantity.value;
      }
    }
  }
}

class Product {
  var id = RxString("");
  var name = RxString("");
  var price = RxDouble(0);
  var quantity = RxInt(0);
  var picture = RxString("");

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.picture,
  });
}
