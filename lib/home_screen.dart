//! statless widget / state full widget

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

//! asset | file | Network
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Search For Product')));
            },
            icon: FaIcon(FontAwesomeIcons.houseLock, color: Colors.white),
          ),
        ],
        title: Text('First App'),
        leading: Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: 300,
          // height: 300,
          color: Colors.blue.shade200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Flexible(
              //   child: Container(
              //     padding: EdgeInsets.all(5),
              //     margin: EdgeInsets.all(10),
              //     decoration: BoxDecoration(
              //       // color: Colors.amberAccent,
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     child: Column(
              //       children: [
              //         Expanded(
              //           flex: 1,
              //           child: Container(color: Colors.blueGrey, height: 100),
              //         ),
              //         Expanded(
              //           flex: 2,
              //           child: Container(color: Colors.deepOrange, height: 100),
              //         ),
              //         Expanded(
              //           flex: 2,
              //           child: Container(color: Colors.greenAccent, height: 100),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),

                child: Column(
                  children: [
                    if (selectedImage != null) Image.file(selectedImage!),
                    IconButton(
                      onPressed: () {
                        pickImageFromGallaey();
                      },
                      icon: Icon(Icons.add_a_photo),
                    ),
                    Image.asset('assets/images/macbook.jpg'),
                    Image.network(
                      'https://images.pexels.com/photos/434346/pexels-photo-434346.jpeg?_gl=1*1yp8ag3*_ga*OTIwMzEwMzEyLjE3NTgwODk5NjU.*_ga_8JE65Q40S6*czE3OTM5OTA2MDckbzMkZzEkdDE3OTM5OTA5MTYkajU5JGwwJGgw',
                    ),
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Macbook Pro m5 ',
                            style: TextStyle(fontSize: 28, color: Colors.white),
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,

                                content: Text(
                                  'Product added Success',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                            //!
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.cartShopping,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  File? selectedImage;

  void pickImageFromGallaey() async {
    final picker = ImagePicker();

    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }
}
