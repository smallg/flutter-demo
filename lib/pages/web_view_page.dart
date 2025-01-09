import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  const WebViewPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: SizedBox(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              width: 200,
              height: 50,
              child: Text('back'),
            ),
          ),
        ),
      ),
    );
  }
}
