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
      uuid: "123",
      author: "Gautham",
      content: "Looking for someone to go to the movies",
      datetime: DateTime.now(),
      pfpurl: "https://avatars.githubusercontent.com/u/48323819?s=40&v=4");

  @override
  void initState() {
    super.initState();
    cards.add(card1);
    cards.add(PostCard(
        uuid: "123",
        author: "Gautham",
        content: "Looking for someone to go to the movies",
        datetime: DateTime.now(),
        pfpurl: "https://avatars.githubusercontent.com/u/48323819?s=40&v=4"));
    cards.add(PostCard(
        uuid: "123",
        author: "Gautham",
        content: "Looking for someone to go to the movies",
        datetime: DateTime.now(),
        pfpurl: "https://avatars.githubusercontent.com/u/48323819?s=40&v=4"));
    cards.add(PostCard(
        uuid: "123",
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
      required this.uuid,
      required this.author,
      required this.content,
      required this.datetime,
      required this.pfpurl})
      : super(key: key);
  final String uuid;
  final String author;
  final String pfpurl;
  final String content;
  final DateTime datetime;

  void checkPosts(
      BuildContext context,
      String imgUrl,
      String name,
      String phoneNo,
      String type,
      int age,
      String message,
      String language,
      String location) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Padding(
              padding: EdgeInsets.all(13),
              child: Card(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 100,
                          width: 110,
                          // color: Colors.accents,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(imgUrl),
                                fit: BoxFit.fill,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$name",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text("Age: $age"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Language: $language"),
                            SizedBox(
                              height: 19,
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        child: Text("Message: \n$message")),
                    SizedBox(
                      height: 19,
                    ),
                    // Text("Language: $language"),
                    // SizedBox(
                    //   height: 19,
                    // ),
                    Text("City: $location"),
                    SizedBox(
                      height: 6,
                    ),
                    Text("Contact Number: $phoneNo")
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: GestureDetector(
          onTap: () {
            print("works");
            checkPosts(context, pfpurl, author, "1234455555", "Expert", 000,
                content, "Languagge", "location");
          },
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
                      SizedBox(
                        width: 90,
                      ),
                      // Text(
                      //   DateFormat('EEE, MMM d').format(datetime),
                      //   style: Theme.of(context).textTheme.bodySmall,
                      // )
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                        child: Text(
                          "Event",
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.tealAccent[200],
                            borderRadius: BorderRadius.circular(8)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9.0, vertical: 4),
                  child: Text(
                    content,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                    //style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Text(
                  DateFormat('EEE, MMM d').format(datetime),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
