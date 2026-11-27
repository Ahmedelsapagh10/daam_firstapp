import 'package:first_project/features/home_screen/data/model/main_news_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsScreen extends StatefulWidget {
  const new({required this.url, super.key});
  final String url;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()..loadRequest(Uri.parse(widget.url));
    //! controller.loadRequest(Uri(host: widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Details')),
      body: WebViewWidget(controller: controller),
    );
  }
}
