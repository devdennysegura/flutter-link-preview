part of link_preview;

class SkypeView extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String url;
  final String favUrl;

  SkypeView(
      {Key key,
      @required this.imageUrl,
      @required this.title,
      this.description,
      @required this.url,
      this.favUrl});

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Image(
          fit: BoxFit.contain,
          image: NetworkImage(imageUrl),
          height: screenSize.height * 0.25,
          width: screenSize.width * 0.84,
        ),
        Container(
          height: screenSize.height * 0.25,
          width: screenSize.width * 0.84,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 0, 0, 0.1),
                Color.fromRGBO(0, 0, 0, 0.3),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          height: screenSize.height * 0.25,
          width: screenSize.width * 0.84,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                width: screenSize.width * 0.80,
                child: Text(
                  title,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                width: screenSize.width * 0.80,
                child: Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 8.0),
                    height: 20.0,
                    width: 20.0,
                    child: Image.network(
                      favUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(url,
                      style: TextStyle(color: Colors.white, fontSize: 12.0))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
