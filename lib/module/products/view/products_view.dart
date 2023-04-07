import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../custom/formatchanger.dart';
import '../controller/products_controller.dart';
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
                // kode yang akan dijalankan saat tombol back ditekan
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
                  label: Text(
                    "data",
                    style: TextStyle(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Obx(
              () {
                return Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                          controller.products[index]
                                                  ["picture"] ??
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.products[index]["name"] ??
                                              "",
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.products[index]
                                                          ['price'] ==
                                                      null
                                                  ? "Rp. 0"
                                                  : "Rp. ${controller.products[index]['price']}",
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
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              controller.doOrder(
                                                controller.products[index]
                                                    ["food_code"],
                                                controller.products[index]
                                                    ["name"],
                                                controller.products[index]
                                                    ["price"],
                                                controller.products[index]
                                                    ["picture"],
                                                controller.products[index]
                                                    ["picture"],
                                              );
                                              controller.addTrolly();
                                            },
                                            child: const Text("Order"),
                                          ),
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
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar: Obx(() {
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            controller.qntyTrolly.value
                                                .toString(),
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
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                      content: Container(
                                        padding: const EdgeInsets.all(0),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                      child: const Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child:
                                                            Text("Rp 50.000"),
                                                      )),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                    child: const Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: TextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                      child: const Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child:
                                                            Text("Rp 50.000"),
                                                      )),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 30),
                                            SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child:
                                                    const Text("Cetak Struk"),
                                              ),
                                            )
                                          ],
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
          }),
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
            )),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
