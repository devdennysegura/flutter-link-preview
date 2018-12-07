import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:link_preview/link_preview.dart';
import 'package:link_preview/widget/whatsapp/index.dart';
import 'package:link_preview/widget/linkedin/index.dart';
import 'package:link_preview/widget/skype/index.dart';
import 'package:link_preview/widget/twitter/index.dart';
import 'package:link_preview/widget/telegram/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LinkPreview previwer = LinkPreview();
  WhatsAppLinkPreview wspPreview = WhatsAppLinkPreview();
  LinkedInLinkPreview liPreview = LinkedInLinkPreview();
  TwitterLinkPreview twPreview = TwitterLinkPreview();
  TelegramLinkPreview tPreview = TelegramLinkPreview();
  SkypeLinkPreview skPreview = SkypeLinkPreview();

  Future<String> _message = Future<String>.value('');
  @override
  void initState() {
    super.initState();
  }

  Future<String> initMetaDataState() async {
    dynamic linkPreview;
    try {
      linkPreview = await previwer.getUrlMetaData(url: 'https://flutter.io');
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
        backgroundColor: Color.fromRGBO(241, 243, 244, 1.0),
        appBar: AppBar(
          title: const Text('Rich Link Preview example app'),
        ),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  child: wspPreview.build('https://whatsapp.com')),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  child: tPreview.build('https://telegram.org')),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  child: skPreview.build('https://skype.com')),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  child: twPreview.build('https://twitter.com')),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  child: liPreview.build('https://linkedin.com')),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    _message = initMetaDataState();
                  });
                },
                textColor: Colors.white,
                child: Text('Test Flutter Preview Metadata'),
                color: Color.fromRGBO(19, 137, 253, 1.0),
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
      ),
    );
  }
}
