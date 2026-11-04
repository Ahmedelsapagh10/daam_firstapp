//! statless widget / state full widget

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [Icon(Icons.search, color: Colors.white)],
        title: Text('First App'),
        leading: Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: Container(
        width: 300,
        height: 300,
        color: Colors.blue.shade200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.orange,

                  borderRadius: BorderRadius.circular(20),
                ),

                child: Center(
                  child: Text('A', style: TextStyle(color: Colors.white)),
                ),
                // padding: EdgeInsets.all(20),
              ),
            ),

            Container(
              height: 80,
              width: 80,
              alignment: Alignment.center,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: Text('A', style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    color: Colors.red,

                    alignment: Alignment.center,
                    child: Text('B', style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text('C', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              // padding: EdgeInsets.all(20),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 70,
                width: 70,
                alignment: Alignment.center,
                color: Colors.black,
                child: Text('C', style: TextStyle(color: Colors.white)),
                // padding: EdgeInsets.all(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
