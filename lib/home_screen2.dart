//! statless widget / state full widget

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenTwo extends StatelessWidget {
  const HomeScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [Icon(Icons.search, color: Colors.white)],
        title: Text('First App'),
        leading: Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: Center(
        child: Icon(CupertinoIcons.music_note, size: 100, color: Colors.red),
      ),
    );
  }
}
