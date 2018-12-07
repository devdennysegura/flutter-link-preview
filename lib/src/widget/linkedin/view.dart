part of link_preview;

class LinkedInView extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String url;

  LinkedInView(
      {Key key,
      @required this.imageUrl,
      @required this.title,
      this.description,
      @required this.url});

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(maxWidth: screenSize.width * 0.84),
      padding: EdgeInsets.only(bottom: 32.0, left: 4.0, top: 4.0, right: 4.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
                margin: EdgeInsets.only(right: 16.0),
                height: screenSize.width * 0.18,
                width: screenSize.width * 0.18,
                color: Colors.white,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: screenSize.width * 0.57,
                child: Text(
                  title,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: screenSize.width * 0.57,
                child: RichText(
                  maxLines: 2,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: url, style: TextStyle(color: Colors.black54)),
                      TextSpan(
                          text: ' $description',
                          style:
                              TextStyle(color: Colors.black, fontSize: 12.0)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
