import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mobile_apps/core.dart';

import '../../../custom/formatchanger.dart';

class DetailPesananWidget extends StatelessWidget {
  const DetailPesananWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductsController());
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
        Obx(() {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Column(
                    children: controller.detailPesanan,
                  )),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Total",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(":"),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            height: 35,
                            width: 200,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                  "Rp. ${FormatChanger().separator(controller.total.string)}"),
                            )),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Uang Dibayar",
                                style: TextStyle(fontSize: 15),
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
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          height: 35,
                          color: Colors.grey[100],
                          width: 200,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              onChanged: (value) {
                                value == ""
                                    ? controller.uangBayar.value = 0
                                    : controller.uangBayar.value =
                                        int.parse(value);
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Kembalian",
                                style: TextStyle(fontSize: 15),
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
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            height: 35,
                            color: Colors.green[100],
                            width: 200,
                            child: Align(
                              alignment: Alignment.centerRight,
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
          );
        }),
      ],
    );
  }
}
