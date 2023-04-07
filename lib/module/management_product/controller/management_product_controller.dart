import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import '../view/management_product_view.dart';

class ManagementProductController extends GetxController {
  ManagementProductView? view;
  final qntyTrolly = RxInt(0);
  final orders = RxList<Widget>([]);
  final detailPesanan = RxList<Widget>([]);
  final products = RxList([]);
  final navBarHeight = RxDouble(60);
  final total = RxInt(0);
  final totalBayar = RxInt(0);
  final kembalian = RxInt(0);
  final uangBayar = RxInt(0);
  final noImage = RxString(
      "https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png");

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  dynamic getProducts() async {
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

  delProducts(id) async {
    try {
      String url = "https://apigenerator.dronahq.com/api/g7s7P925/TestAlan/$id";
      BaseOptions options = BaseOptions(
        baseUrl: url,
        connectTimeout: const Duration(milliseconds: 60000),
        receiveTimeout: const Duration(milliseconds: 30000),
      );

      Dio dio = Dio(options);

      Response response = await dio.delete(url);

      if (response.statusCode == 200) {
        Get.snackbar(
          "Success",
          "Delete data success",
          backgroundColor: Colors.white,
          colorText: Colors.blue[800],
        );
        Get.back();
        getProducts();
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
}
