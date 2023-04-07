import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../controller/form_product_controller.dart';
import 'package:mobile_apps/core.dart';
import 'package:get/get.dart';

class FormProductView extends StatelessWidget {
  const FormProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormProductController>(
      init: FormProductController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.grey,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            title: const Text(
              "Add Product",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Obx(() {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade200,
                      ),
                      padding: const EdgeInsets.all(10.0),
                      height: 300,
                      width: double.infinity,
                      child: controller.foto != ""
                          ? InkWell(
                              onTap: () {
                                controller.getPicture();
                              },
                              child: controller.foto == ""
                                  ? Lottie.asset(
                                      'assets/lottie/no_image.json',
                                      width: 200,
                                      height: 200,
                                    )
                                  : Image.file(
                                      File(controller.foto.toString()),
                                      width: 250,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                            )
                          : InkWell(
                              onTap: () {
                                controller.getPicture();
                              },
                              child: controller.imagen == null
                                  ? Lottie.asset(
                                      'assets/lottie/no_image.json',
                                      width: 200,
                                      height: 200,
                                    )
                                  : Image.file(
                                      File(controller.foto.toString()),
                                      width: 250,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    )),
                    );
                  }),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      labelText: "Product Code",
                    ),
                    onChanged: (value) =>
                        controller.customer_name.value = value,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      labelText: "Product Name",
                    ),
                    onChanged: (value) => controller.hp.value = value,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      labelText: "Price",
                    ),
                    onChanged: (value) => controller.address.value = value,
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text(
                  "Save",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // controller.doSave();
                  // controller.edit.value.obs == true
                  //     ? controller.doUpdate(controller.id.value)
                  //     : controller.doSave();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
