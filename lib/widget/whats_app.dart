import 'package:flutter/material.dart';

class WhatsAppPreview extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String url;

  WhatsAppPreview(
      {Key key,
      @required this.imageUrl,
      @required this.title,
      this.description,
      @required this.url});

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(maxWidth: screenSize.width * 0.84),
      padding: EdgeInsets.all(4.0),
      decoration: new BoxDecoration(
        color: Color.fromRGBO(223, 249, 204, 1.0),
        borderRadius: new BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
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
                width: screenSize.width * 0.58,
                child: Text(
                  title,
                  maxLines: 1,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
              ),
              Container(
                width: screenSize.width * 0.58,
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Text(
                        description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12.0,
                          wordSpacing: 0.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                url,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
