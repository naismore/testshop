import 'package:flutter/material.dart';

import '../../../models/Product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreen();
}

class _ProductScreen extends State<ProductScreen> {
  Product? product;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is Product, '');
    product = args as Product;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product!.title ?? '...'),
      ),
      body: Center(child: Padding(

    padding: const EdgeInsets.all(16.0),

    child: Column(

    children: [

    product!.imageUrl != null

    ? Container(

    height: 200,

    width: 200,

    decoration: BoxDecoration(

    image: DecorationImage(

    image: NetworkImage(product!.imageUrl!), // Display the image if the URL is not null

    fit: BoxFit.cover,

    ),

    borderRadius: BorderRadius.circular(10),

    ),

    )

        : Container(

    height: 200,

    width: 200,

    decoration: BoxDecoration(

    color: Colors.grey[200], // Display a grey box if the URL is null

    borderRadius: BorderRadius.circular(10),

    ),

    child: Center(

    child: Text('No image'),

    ),

    ),

    SizedBox(height: 16),


    // Product Name

    Text(

    product!.title,

    style: TextStyle(

    fontSize: 24,

    fontWeight: FontWeight.bold,

    ),

    ),

    SizedBox(height: 16),


    // Product Description

    Text(

      (product!.description == '' ) ? 'Нет описания' : product!.description,

    style: TextStyle(

    fontSize: 18,

    ),

    ),

    ],

    ),

    ),

    ),
    );
  }
}
