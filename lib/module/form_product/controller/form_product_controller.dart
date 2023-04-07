import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_apps/core.dart';

class FormProductController extends GetxController {
  FormProductView? view;
  final productCode = RxString("");
  final productName = RxString("");
  final price = RxString("");
  final image_url = RxString("");
  final created_by = RxString("mroni");
  final created_date = DateTime.now();
  XFile? imagen;
  final foto = RxString("");
  final edit = RxBool(false);
  final urlSementara = RxString(
      "https://t-2.tstatic.net/palembang/foto/bank/images/Resep-sate-Padang.jpg");

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future getCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    imagen = image;
    foto.value = image.path;
  }

  Future getGalery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    imagen = image;
    foto.value = image.path;
  }

  getPicture() async {
    var context = Get.context;
    showDialog(
      context: context!,
      builder: (BuildContext context) => AlertDialog(
        title: const Center(
          child: Text(
            "Chose Image From",
            style: TextStyle(color: Color(0xff0D47A1)),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0D47A1)),
                  onPressed: () {
                    Get.back();
                    getCamera();
                  },
                  child: const Text("Camera")),
              const SizedBox(width: 5),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0D47A1)),
                  onPressed: () {
                    Get.back();
                    getGalery();
                  },
                  child: const Text("Galery"))
            ],
          ),
        ],
      ),
    );
  }

  static Future<dynamic> doSave(BuildContext context, var data) async {
    var c = Get.put(ManagementProductController());
    String url = "https://apigenerator.dronahq.com/api/g7s7P925/TestAlan";
    BaseOptions options = BaseOptions(
      baseUrl: url,
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );

    Dio dio = Dio(options);
    Response response = await dio.post(url, data: data);
    try {
      if (response.statusCode == 201) {
        Get.back();
        Get.snackbar(
          "Success",
          "Save data success ",
          backgroundColor: Colors.white,
          colorText: Colors.blue[800],
        );
        c.getProducts();
      } else {
        Get.snackbar(
          "Sorry",
          "Save data failed",
          backgroundColor: Colors.white,
          colorText: Colors.red[800],
        );
        return null;
      }
    } catch (e) {
      Get.snackbar(
        "Sorry",
        "Connection problem",
        backgroundColor: Colors.white,
        colorText: Colors.red[800],
      );
      return null;
    }
  }
}
