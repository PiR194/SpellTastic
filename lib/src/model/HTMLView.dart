import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HTMLView extends StatelessWidget {
  final String htmlString;

  HTMLView({required this.htmlString});

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'data:text/html;base64,${base64Encode(const Utf8Encoder().convert(htmlString))}',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
