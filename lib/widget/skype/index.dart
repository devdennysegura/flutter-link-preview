import 'package:link_preview/widget/preview_link.dart';
import './view.dart';

class SkypeLinkPreview extends PreviewLink {
  build(String url) {
    return this.render(url, (dynamic body) {
      return View(
        imageUrl: body['image_url'],
        title: body['title'],
        url: body['url'],
        favUrl: body['favicon'],
        description: body['description'],
      );
    });
  }
}
