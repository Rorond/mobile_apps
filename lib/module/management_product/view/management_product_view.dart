import 'package:flutter/material.dart';
import 'package:mobile_apps/module/management_product/widget/productslist.dart';
import 'package:mobile_apps/core.dart';
import 'package:get/get.dart';

class ManagementProductView extends StatelessWidget {
  const ManagementProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementProductController>(
      init: ManagementProductController(),
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
            title: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: const ProductListWidget(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue.shade800,
            child: const Icon(Icons.add),
            onPressed: () {
              Get.to(const FormProductView());
            },
          ),
        );
      },
    );
  }
}
