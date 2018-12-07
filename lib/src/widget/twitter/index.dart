part of link_preview;

class TwitterLinkPreview extends PreviewLink {
  build(String url) {
    return this.render(url, (dynamic body) {
      return TwitterView(
        imageUrl: body['image_url'],
        title: body['title'],
        url: body['url'],
        description: body['description'],
      );
    });
  }
}
