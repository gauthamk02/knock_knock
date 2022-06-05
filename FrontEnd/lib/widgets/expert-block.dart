import 'package:flutter/material.dart';
import '../constants.dart';

class ExpertBlock extends StatelessWidget {
  final String name;
  final String lang;
  final String url;
  final String city;
  final String type;

  ExpertBlock(this.name, this.lang, this.url, this.city, this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        elevation: 8,
        child: Column(children: <Widget>[
          SizedBox(
            height: 7,
          ),
          Container(
            width: 95,
            height: 100,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage("$url"),
                // NetworkImage(
                //     "https://media.istockphoto.com/photos/explorer-holding-binoculars-picture-id180642049"),
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
                  "$name",
                  style: kBodyText1,
                ),
                Text(
                  '$lang',
                ),
                Text(
                  'City: $city',
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
