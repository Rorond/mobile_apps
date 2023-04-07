import 'package:flutter/material.dart';
import 'package:mobile_apps/core.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Dashboard"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraint) {
                      List menus = [
                        {
                          "icon": Icons.dashboard,
                          "label": "Dashboard\n",
                          "onTap": () {},
                        },
                        {
                          "icon": Icons.production_quantity_limits,
                          "label": "Management\nProduct",
                          "onTap": () {
                            Get.to(const ManagementProductView());
                          },
                        },
                        {
                          "icon": Icons.shopify_sharp,
                          "label": "Transaction\n",
                          "onTap": () {
                            Get.to(const ProductsView());
                          },
                        },
                      ];

                      return Wrap(
                        children: List.generate(
                          menus.length,
                          (index) {
                            var item = menus[index];

                            var size = constraint.biggest.width / 2;

                            return SizedBox(
                              width: size,
                              height: size,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.blueGrey,
                                  animationDuration:
                                      const Duration(milliseconds: 1000),
                                  backgroundColor: Colors.transparent,
                                  splashFactory: InkSplash.splashFactory,
                                  shadowColor: Colors.transparent,
                                  elevation: 0.0,
                                ),
                                onPressed: () => item["onTap"](),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      item["icon"],
                                      color: Colors.blueGrey,
                                      size: 50,
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      "${item["label"]}",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
