import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live center example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Live center'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isListView = false;

  Widget get listview {
    return ListView(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.pink,
          alignment: Alignment.center,
          child: Text('Listview'),
        ),
        const Live(),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.pink,
          alignment: Alignment.center,
          child: Text('Listview'),
        ),
      ],
    );
  }

  Widget get single {
    return const Live();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Row(
            children: [
              Text(isListView ? 'ListView' : 'Single'),
              Switch(
                value: isListView,
                onChanged: (value) {
                  setState(() {
                    isListView = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      body: isListView ? listview : single,
    );
  }
}

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

  Set<Factory<OneSequenceGestureRecognizer>> get gestureRecognizers {
    return <Factory<OneSequenceGestureRecognizer>>{};
  }

  @override
  Widget build(BuildContext context) {
    final webview = Platform.isAndroid
        ? WebViewWidget.fromPlatformCreationParams(
            params: AndroidWebViewWidgetCreationParams(
              controller: webViewController.platform,
              gestureRecognizers: gestureRecognizers,
              displayWithHybridComposition: true,
            ),
          )
        : WebViewWidget(
            controller: webViewController,
            gestureRecognizers: gestureRecognizers,
          );
    return SizedBox(
      height: 20000,
      width: double.infinity,
      child: webview,
    );
  }
}
