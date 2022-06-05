import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<PostCard> cards = [];

  PostCard card1 = PostCard(
      author: "Gautham",
      content: "Looking for someone to go to the movies",
      datetime: DateTime.now(),
      pfpurl: "https://avatars.githubusercontent.com/u/48323819?s=40&v=4");

  @override
  void initState() {
    super.initState();
    cards.add(card1);
    cards.add(PostCard(
        author: "Gautham",
        content: "Looking for someone to go to the movies",
        datetime: DateTime.now(),
        pfpurl: "https://avatars.githubusercontent.com/u/48323819?s=40&v=4"));
    cards.add(PostCard(
        author: "Gautham",
        content: "Looking for someone to go to the movies",
        datetime: DateTime.now(),
        pfpurl: "https://avatars.githubusercontent.com/u/48323819?s=40&v=4"));
    cards.add(PostCard(
        author: "Gautham",
        content: "Looking for someone to go to the movies",
        datetime: DateTime.now(),
        pfpurl: "https://avatars.githubusercontent.com/u/48323819?s=40&v=4"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return cards[index];
            }),
            itemCount: cards.length,
            shrinkWrap: true,
          ),
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  PostCard(
      {Key? key,
      required this.author,
      required this.content,
      required this.datetime,
      required this.pfpurl})
      : super(key: key);
  final String author;
  final String pfpurl;
  final String content;
  final DateTime datetime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(pfpurl),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      author,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      //style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                  //style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Text(
                DateFormat('yyyy-MM-dd kk:mm').format(datetime),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
