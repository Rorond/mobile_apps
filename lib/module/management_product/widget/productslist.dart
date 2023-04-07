import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_apps/core.dart';

import '../../../custom/formatchanger.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ManagementProductController());
    return Obx(() {
      return Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              childAspectRatio: (180 / 285),
            ),
            itemCount: controller.products.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  width: 160.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 160.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              controller.products[index]["picture"] ??
                                  controller.noImage.value,
                            ),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.blue[400],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.products[index]["name"] ?? "",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.products[index]['price'] == null
                                      ? "Rp. 0"
                                      : "Rp. ${FormatChanger().separator(controller.products[index]['price'])}",
                                  style: const TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  "/Porsi",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Center(
                                                  child: Text(
                                                      "Halaman ini masih dalam pengembangan!"),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: const Text("Ok"),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: const Text("Edit"),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: SizedBox(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red[800]),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Center(
                                                  child: Text(
                                                      "Are you sure delete data...???"),
                                                ),
                                                actions: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Get.back();
                                                              controller.delProducts(
                                                                  controller.products[
                                                                          index]
                                                                      ['id']);
                                                            },
                                                            child: const Text(
                                                                "Yes"),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 50),
                                                      Expanded(
                                                        child: Container(
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: const Text(
                                                                "No"),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      child: const Text("Delete"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );
    });
  }
}
