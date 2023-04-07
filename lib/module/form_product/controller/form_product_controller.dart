import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../view/form_product_view.dart';

class FormProductController extends GetxController {
  FormProductView? view;
    final id = RxString("");
  final customer_id = RxString("CUST001");
  final customer_name = RxString("");
  final card_identity = RxString("");
  final hp = RxString("");
  final address = RxString("");
  final image_url = RxString("");
  final created_by = RxString("mroni");
  final created_date = DateTime.now();
  XFile? imagen;
  final foto = RxString("");
  final edit = RxBool(false);

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

  
}