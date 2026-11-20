import 'package:first_project/local_storage/local_data.dart';
import 'package:first_project/screens/image_view.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_image_widget.dart';
import '../widgets/custom_widget.dart';
import '../model/product_model.dart';

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
];

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          curve: Curves.easeInOut,
          tag: 'xyz',
          child: Text(
            "Welcome ${arg['email']}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await MyLocalStorage().clearUserData();
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
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
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/image',
                arguments: ["image_$index", images[index]],
              );
            },
            child: Hero(
              tag: images[index],
              curve: Curves.easeInOut,

              child: Image.asset(images[index], fit: BoxFit.cover),
            ),
          );
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
