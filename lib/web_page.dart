import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class WebPage extends StatefulWidget {
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late InAppWebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add((bool stopDefaultButtonEvent, RouteInfo info) {
      _webViewController.goBack(); // Navigate back in WebView
      return true; // Prevent default behavior
    });
  }

  @override
  void dispose() {
    BackButtonInterceptor.removeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri("https://astra.easy2it.com/rider/login"),
        ),
        initialSettings: InAppWebViewSettings(
          supportZoom: false,
          allowFileAccess: true,
          useOnLoadResource: true,
          mediaPlaybackRequiresUserGesture: false,
          allowsInlineMediaPlayback: true,
          allowFileAccessFromFileURLs: true,
        ),
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
      ),
    );
  }
}
