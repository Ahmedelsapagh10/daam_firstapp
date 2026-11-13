import 'package:first_project/details.dart';
import 'package:flutter/material.dart';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({
    required this.price,
    required this.productImage,
    required this.productName,
    super.key,
  });
  final String productName;
  final String productImage;
  final double price;

  @override
  State<MyCustomWidget> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  @override
  void initState() {
    print('productName ${widget.productName}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onLongPress: () {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text(productName)));
      // },
      // onDoubleTap: () {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text(productName), backgroundColor: Colors.red),
      //   );
      // },

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              price: widget.price,
              productImage: widget.productImage,
              productName: widget.productName,
            ),
          ),
        );
      },
      child: Container(
        width: 100,
        height: 120,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blueGrey.shade100,
        ),
        child: Column(
          children: [
            Flexible(
              child: Container(
                color: Colors.red,
                child: Image.asset(
                  widget.productImage,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      widget.productName,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    widget.price.toString(),

                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
