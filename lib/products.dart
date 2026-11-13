import 'package:first_project/image_view.dart';
import 'package:flutter/material.dart';

import 'custom_image_widget.dart';
import 'custom_widget.dart';

class ProductsScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

List images = [
  'assets/images/1.jpg',
  'assets/images/2.jpg',
  'assets/images/3.jpg',
  'assets/images/4.jpg',
  'assets/images/5.jpg',
  'assets/images/6.jpg',
  'assets/images/7.jpg',
  'assets/images/8.jpg',
  'assets/images/5.jpg',
  'assets/images/6.jpg',
  'assets/images/7.jpg',
  'assets/images/8.jpg',
];

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('AppBar')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        // itemCount: myWidgets.length,
        itemCount: images.length,
        itemBuilder: (context, index) {
          // return myWidgets[index];
          return MyImageWidget(image: images[index]);
        },
      ),
    );
  }
}
//! diff > Listview + SingleChild + Column

List<Widget> myWidgets = [
  MyCustomWidget(
    price: 139.5,
    productName: 'Coffee',
    productImage: 'assets/images/1.jpg',
  ),
  MyCustomWidget(
    price: 45,
    productName: 'Tea',
    productImage: 'assets/images/2.jpg',
  ),
  MyCustomWidget(
    price: 45,
    productName: 'Tea',
    productImage: 'assets/images/3.jpg',
  ),
  MyCustomWidget(
    price: 90,
    productName: 'IceCoffee',
    productImage: 'assets/images/4.jpg',
  ),
  MyCustomWidget(
    price: 139.5,
    productName: 'Coffee',
    productImage: 'assets/images/5.jpg',
  ),
  MyCustomWidget(
    price: 45,
    productName: 'Tea',
    productImage: 'assets/images/6.jpg',
  ),
  MyCustomWidget(
    price: 45,
    productName: 'Tea',
    productImage: 'assets/images/7.jpg',
  ),
  MyCustomWidget(
    price: 90,
    productName: 'IceCoffee',
    productImage: 'assets/images/8.jpg',
  ),
];
