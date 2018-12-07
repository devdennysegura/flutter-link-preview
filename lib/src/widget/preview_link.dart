part of link_preview;

class PreviewLink {
  AsyncMemoizer memoizer;
  MethodChannel channel;
  PreviewLink() {
    this.channel = MethodChannel('plugins.flutter.io/link_preview');
    this.memoizer = AsyncMemoizer();
  }

  Widget render(String url, Function widget) {
    return FutureBuilder(
      future: this.getFuture('metaData', {'url': url}),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? snapshot.hasError ? Container() : widget(snapshot.data)
            : Container();
      },
    );
  }

  getFuture(String name, dynamic params) {
    return this.memoizer.runOnce(() async {
      return await channel.invokeMethod(name, params);
    });
  }
}
