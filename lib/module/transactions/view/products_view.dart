import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mobile_apps/core.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      init: ProductsController(),
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
            child: const ProductList(),
          )),
          bottomNavigationBar: const BottomNavigateWidget(),
          floatingActionButton: SizedBox(
            height: 20,
            width: 20,
            child: FittedBox(
              child: FloatingActionButton(
                backgroundColor: Colors.blue[900],
                onPressed: () {
                  if (controller.navBarHeight.value == 60) {
                    controller.navBarHeight.value = 300;
                  } else {
                    controller.navBarHeight.value = 60;
                  }
                },
                child: const Icon(
                  Icons.keyboard_arrow_up_sharp,
                  size: 50,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
