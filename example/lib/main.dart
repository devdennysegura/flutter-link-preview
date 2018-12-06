import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:link_preview/link_preview.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LinkPreview previwer = LinkPreview();
  Future<String> _message = Future<String>.value('');
  @override
  void initState() {
    super.initState();
  }

  Future<String> initMetaDataState() async {
    dynamic linkPreview;
    try {
      linkPreview = await previwer.getUrlMetaData(url: 'https://whatsapp.com');
    } on PlatformException catch (e) {
      debugPrint(e.message);
      linkPreview = 'Failed to get platform version.';
    }
    return linkPreview.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rich Link Preview example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            previwer.whatsAppLinkPreview(url: 'https://flutter.io'),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _message = initMetaDataState();
                });
              },
              textColor: Colors.white,
              child: Text('Test Whatsapp Preview Metadata'),
              color: Colors.blue,
            ),
            FutureBuilder<String>(
              future: _message,
              builder: (_, AsyncSnapshot<String> snapshot) {
                return Text(snapshot.data ?? '');
              },
            ),
          ],
        ),
      ),
    );
  }
}
