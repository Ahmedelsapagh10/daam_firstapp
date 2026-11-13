import 'package:flutter/material.dart';

//! Name of Product
//! Image of Product
//! price of Product
class DetailsScreen extends StatefulWidget {
  const new({
    super.key,
    required this.price,
    required this.productImage,
    required this.productName,
  });
  final String productName;
  final String productImage;
  final double price;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //!
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Image.asset(widget.productImage),

              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ],
          ),
          //!
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Name : ${widget.productName}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.brown,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Price : ${widget.price.toString()}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
