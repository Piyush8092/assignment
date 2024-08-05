import 'package:assignment/Screen/first_screen.dart';
import 'package:assignment/Screen/second_screen.dart';
import 'package:assignment/Screen/third_screen.dart';
import 'package:assignment/controllerGetx/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => FirstScreen()),
        GetPage(
            name: '/products',
            page: () => SecondScreen(),
            binding: BindingsBuilder(() {
              Get.put(ProductController());
            })),
        GetPage(name: '/details', page: () => ThirdScreen()),
      ],
    );
  }
}
