import 'package:assignment/controllerGetx/product_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Products List')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.products.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const ListTile(
                title: Text(
                  'Products List',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
            }

            final product = controller.products[index - 1];
            return Card(
              child: ListTile(
                leading: product.thumbnail != null
                    ? CachedNetworkImage(
                        imageUrl: product.thumbnail!,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
                    : null,
                title: Text(product.title.toString()),
                subtitle: Text('\$${product.price!.toStringAsFixed(2)}'),
                trailing: Text(product.category.toString()),
                onTap: () => controller.selectProduct(product),
              ),
            );
          },
        );
      }),
    );
  }
}
