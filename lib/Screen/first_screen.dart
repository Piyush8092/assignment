import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Center(
        child: InkWell(
          onTap: () {
            Get.toNamed('/products');
          },
          child: Container(
            height: Get.height * 0.1,
            width: Get.width * 0.6,
            color: Colors.black,
            child: const Center(
              child: Text(
                'View Products',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
