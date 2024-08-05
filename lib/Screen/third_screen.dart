import 'package:assignment/controllerGetx/product_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Obx(() {
        final product = controller.selectedProduct.value;
        if (product == null) {
          return const Center(child: Text('No product selected'));
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                product.thumbnail != null
                    ? CachedNetworkImage(
                        imageUrl: product.thumbnail!,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
                    : Container(),
                const SizedBox(height: 16.0),
                Text(
                  product.title.toString(),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price: \$${product.price!.toStringAsFixed(2)}'),
                    Text(
                      'Discount Price: \$${product.discountPercentage!.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Category: ${product.category}'),
                    Text(
                      'Rating: ${product.rating}',
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text('${product.brand}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                // Add more details here if needed
                const SizedBox(
                  height: 3,
                ),
                Text('${product.description}'),
                const SizedBox(
                  height: 5,
                ),
                ListTile(
                  title: Text(
                    'Stock: ${product.stock.toString()}',
                    style: const TextStyle(color: Colors.green),
                  ),
                  trailing: Text(
                    'availabilityStatus: ${product.availabilityStatus.toString()}',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                const ListTile(
                  minTileHeight: 30,
                  tileColor: Colors.amber,
                  title: Center(child: Text('Buy Now')),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    '${product.warrantyInformation}',
                    style: const TextStyle(color: Colors.blue),
                  ),
                  trailing: Text('${product.shippingInformation}',
                      style: const TextStyle(color: Colors.blue)),
                ),
                Text(
                    'Dimention: ${product.dimensions!.width} * ${product.dimensions!.height} * ${product.dimensions!.depth}'),
                Text('Weight: ${product.weight}'),
                const SizedBox(
                  height: 14,
                ),

                //Rating and Review
                const Text(
                  'Rating & Reviews',
                  style: TextStyle(fontSize: 22),
                ),
                if (product.reviews != null && product.reviews!.isNotEmpty)
                  ...product.reviews!.map((review) {
                    return ListTile(
                        title: Text('Rating: ${review.rating ?? 'N/A'}'),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Comment: ${review.comment ?? 'No comment'}'),
                              Text('Date: ${review.date ?? 'No date'}'),
                              Text(
                                  'Reviewer: ${review.reviewerName ?? 'Anonymous'}'),
                              Text(
                                  'Email: ${review.reviewerEmail ?? 'No email'}'),
                            ]));
                  }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
