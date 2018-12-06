import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import 'package:link_preview/widget/whats_app.dart';

class LinkPreview {
  static const MethodChannel _channel =
      const MethodChannel('plugins.flutter.io/link_preview');

  Future<dynamic> getUrlMetaData({@required String url}) async {
    return await _channel.invokeMethod('metaData', {'url': url});
  }

  Widget whatsAppLinkPreview({@required String url}) {
    return FutureBuilder(
      future: _channel.invokeMethod('metaData', {'url': url}),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? (snapshot.hasError
                ? Container()
                : WhatsAppPreview(
                    imageUrl: snapshot.data['image_url'],
                    title: snapshot.data['title'],
                    url: snapshot.data['url'],
                    description: snapshot.data['description'],
                  ))
            : Container();
      },
    );
  }
}
