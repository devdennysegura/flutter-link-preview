import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class LinkPreview {
  final MethodChannel _channel =
      MethodChannel('plugins.flutter.io/link_preview');

  Future<dynamic> getUrlMetaData({@required String url}) async {
    return await _channel.invokeMethod('metaData', {'url': url});
  }
}
