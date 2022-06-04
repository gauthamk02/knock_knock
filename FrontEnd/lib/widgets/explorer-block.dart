import 'package:flutter/material.dart';
import '../constants.dart';

class ExplorerBlock extends StatelessWidget {
  const ExplorerBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 135,
      child: GestureDetector(
        child: Card(
          elevation: 8,
          child: GestureDetector(
            onTap: () => print("mdf"),
            child: Column(children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                width: 90,
                height: 120,
                padding: EdgeInsets.all(20),
                // height: index.isEven ? 200 : 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://media.istockphoto.com/photos/explorer-holding-binoculars-picture-id180642049"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "kBodyText habibi",
                      style: kBodyText,
                    ),
                    Text(
                      'Rating',
                      style: TextStyle(
                        color: kTextColor.withOpacity(.5),
                      ),
                    ),
                    Text(
                      'Lang2',
                      style: TextStyle(
                        color: kTextColor.withOpacity(.5),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
