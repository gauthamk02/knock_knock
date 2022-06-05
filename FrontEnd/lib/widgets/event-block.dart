import 'package:flutter/material.dart';

class EventBlock extends StatelessWidget {
  const EventBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // width: ,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          // height: 50,
          child: Card(
            elevation: 9,
            child: ListTile(
              leading:
                  // Text("sdf"),
                  Container(
                height: 75,
                width: 79,
                // color: Colors.accents,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg"),
                      fit: BoxFit.fill,
                    )),
              ),
              title: Text("Event name"),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("Location"), Text("Date")],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
