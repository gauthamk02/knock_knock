import 'package:flutter/material.dart';
import '../constants.dart';

class ExpertBlock extends StatelessWidget {
  const ExpertBlock({Key? key}) : super(key: key);

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
            width: 80,
            height: 100,
            padding: EdgeInsets.all(20),
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
                  style: kBodyText1,
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
    );
  }
}
