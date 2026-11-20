import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class MyFlashApp extends StatefulWidget {
  const new({super.key});

  @override
  State<MyFlashApp> createState() => _MyFlashAppState();
}

class _MyFlashAppState extends State<MyFlashApp> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Flash App')),
      body: Center(
        child: Switch(
          value: switchValue,
          onChanged: (value) async {
            final isTorchAvailable = await TorchLight.isTorchAvailable();
            if (isTorchAvailable) {
              setState(() {
                switchValue = value;
              });
              if (switchValue == true) {
                await TorchLight.enableTorch();
              } else {
                await TorchLight.disableTorch();
              }
            } else {
              log('Not Available');
            }
          },
        ),
      ),
    );
  }
}
