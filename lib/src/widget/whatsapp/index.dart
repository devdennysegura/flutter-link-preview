part of link_preview;

class WhatsAppLinkPreview extends PreviewLink {
  build(String url) {
    return this.render(url, (dynamic body) {
      return WhatsAppView(
        imageUrl: body['image_url'],
        title: body['title'],
        url: body['url'],
        description: body['description'],
      );
    });
  }
}
