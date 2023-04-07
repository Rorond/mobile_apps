import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_apps/core.dart';

import '../../../custom/formatchanger.dart';

class BottomNavigateWidget extends StatelessWidget {
  const BottomNavigateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductsController());
    return Obx(() {
      return Container(
        padding: const EdgeInsets.only(bottom: 5.0),
        height: controller.navBarHeight.value,
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PreferredSize(
                preferredSize: const Size.fromHeight(8.0),
                child: Divider(
                  height: 1.0,
                  thickness: 4.0,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              const Icon(
                                Icons.shopping_bag_outlined,
                                size: 35.0,
                                color: Colors.grey,
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  height: 18,
                                  width: 18,
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      controller.qntyTrolly.value.toString(),
                                      style: const TextStyle(
                                        fontSize: 8,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 20),
                          Text(
                            "Rp ${FormatChanger().separator(controller.total.value.toString())}",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.kembalian.value = 0;
                          controller.getDetailPesanan();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.restaurant,
                                        color: Colors.blue.shade900,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    SizedBox(
                                      child: Text(
                                        'Detail Pesanan',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                actions: <Widget>[
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: SingleChildScrollView(
                                      controller: ScrollController(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Column(
                                            children: controller.detailPesanan,
                                          )),
                                          const SizedBox(height: 30),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  width: 80,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      Text(
                                                        "Total",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      Text(":"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10,
                                                            left: 10),
                                                    height: 35,
                                                    width: 200,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                          "Rp. ${FormatChanger().separator(controller.total.string)}"),
                                                    )),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  width: 80,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      Text(
                                                        "Uang Dibayar",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      Text(":"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0,
                                                          right: 10.0),
                                                  height: 35,
                                                  color: Colors.grey[100],
                                                  width: 200,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: TextField(
                                                      textAlign:
                                                          TextAlign.right,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none),
                                                      onChanged: (value) {
                                                        value == ""
                                                            ? controller
                                                                .uangBayar
                                                                .value = 0
                                                            : controller
                                                                    .uangBayar
                                                                    .value =
                                                                int.parse(
                                                                    value);
                                                        controller.calculate();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  width: 80,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      Text(
                                                        "Kembalian",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      Text(":"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0),
                                                    height: 35,
                                                    color: Colors.green[100],
                                                    width: 200,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                          "Rp. ${FormatChanger().separator(controller.kembalian.value.toString())}"),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 30),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: const Text("Cetak Struk"),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text("Charge"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: controller.orders,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
