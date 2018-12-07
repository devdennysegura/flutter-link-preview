part of link_preview;

class SkypeLinkPreview extends PreviewLink {
  build(String url) {
    return this.render(url, (dynamic body) {
      return SkypeView(
        imageUrl: body['image_url'],
        title: body['title'],
        url: body['url'],
        favUrl: body['favicon'],
        description: body['description'],
      );
    });
  }
}
