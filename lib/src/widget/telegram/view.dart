part of link_preview;

class TelegramView extends StatelessWidget {
  final String url;
  final String imageUrl;
  final String title;
  final String description;
  String newUrl;

  TelegramView({
    Key key,
    @required this.url,
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  }) {
    this.newUrl = this.url.contains('http') ? this.url : 'www.${this.url}';
  }

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(maxWidth: screenSize.width * 0.84),
      padding: EdgeInsets.all(16.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            newUrl,
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Color.fromRGBO(41, 158, 216, 1.0),
              fontSize: 10.0,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 2.0,
                    color: Color.fromRGBO(41, 158, 216, 1.0),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: Column(
                    children: <Widget>[
                      Container(
                        width: screenSize.width * 0.50,
                        child: Text(
                          title,
                          maxLines: 1,
                          style: TextStyle(
                            color: Color.fromRGBO(41, 158, 216, 1.0),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.0),
                        width: screenSize.width * 0.50,
                        child: Row(
                          children: <Widget>[
                            new Expanded(
                              child: new Text(
                                description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  wordSpacing: 0.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
                  Container(
                    height: screenSize.width * 0.18,
                    width: screenSize.width * 0.18,
                    color: Colors.white,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
