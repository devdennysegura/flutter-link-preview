# link_preview
A Rich Link Preview flutter plugin.

<div style="display:flex;flex-direction:row;">
        <img src="screenshots/flutter_01.png" alt="screen_01" height="400" />
        <img src="screenshots/flutter_02.png" alt="screen_02" height="400" />
</div>

## Usage
To use this plugin, add `link_preview` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### Example

``` dart
import 'package:flutter/material.dart';
import 'package:link_preview/widget/whatsapp/index.dart';

WhatsAppLinkPreview whatsapp = WhatsAppLinkPreview();

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
      child: whatsapp.build('https://whatsapp.com')
      ),
    ),
  ));
}
```