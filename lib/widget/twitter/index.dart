import 'package:link_preview/widget/preview_link.dart';
import './view.dart';

class TwitterLinkPreview extends PreviewLink {
  build(String url) {
    return this.render(url, (dynamic body) {
      return View(
        imageUrl: body['image_url'],
        title: body['title'],
        url: body['url'],
        description: body['description'],
      );
    });
  }
}
