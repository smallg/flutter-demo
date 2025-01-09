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
  String? name;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var map = ModalRoute.of(context)?.settings.arguments;
      if (map is Map) {
        name = map['name'];
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(widget.title)),
      appBar: AppBar(title: Text(name ?? '')),
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
