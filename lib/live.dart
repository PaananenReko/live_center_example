import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Live extends StatefulWidget {
  const Live({super.key});

  @override
  LiveState createState() => LiveState();
}

class LiveState extends State<Live> {
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(navigationDelegate)
      ..setBackgroundColor(Colors.white);
    loadPage();
  }

  NavigationDelegate get navigationDelegate {
    return NavigationDelegate(
      onNavigationRequest: (request) => NavigationDecision.navigate,
    );
  }

  void loadPage() {
    webViewController.loadRequest(
      Uri.parse(
        'https://livecenter.norkon.net/frame/keskisuomalainen/59413/default',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4000,
      width: double.infinity,
      child: WebViewWidget(
        controller: webViewController,
        gestureRecognizers: {
          Factory<TapGestureRecognizer>(() => TapGestureRecognizer()),
        },
      ),
    );
  }
}
