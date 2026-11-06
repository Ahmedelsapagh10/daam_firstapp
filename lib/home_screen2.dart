import 'package:flutter/material.dart';

class MyStatefulScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<MyStatefulScreen> createState() => _MyStatefulScreenState();
}

class _MyStatefulScreenState extends State<MyStatefulScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),

      body: Center(
        child: Text('counter : $counter', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
