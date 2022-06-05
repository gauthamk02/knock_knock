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
  List<PostCard> _cards = [];

  @override
  void initState() {
    super.initState();
    _cards.add(PostCard(
        uuid: "123",
        author: "Gautham Krishnan",
        content: "Looking for someone to go to the movies",
        datetime: DateTime.now(),
        pfpurl:
            "https://images.unsplash.com/photo-1642231748800-a44a5a1a2a0d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=839&q=80"));
    _cards.add(PostCard(
        uuid: "123",
        author: "Dharshan Raval",
        content: "Hey is anyone interested for trekking this weekend.",
        datetime: DateTime.now(),
        pfpurl:
            "https://wikibio.in/wp-content/uploads/2019/01/Darshan-Raval-image.jpg"));
    _cards.add(PostCard(
        uuid: "123",
        author: "Aashray Katiyar",
        content:
            "Hey, I am new to Kochi and looking for people to go on a weekend trip.",
        datetime: DateTime.now(),
        pfpurl:
            "https://qph.fs.quoracdn.net/main-thumb-357007265-200-uisgvhlwjfzgzxavvrhslbkuzsamytye.jpeg"));
    _cards.add(PostCard(
        uuid: "123",
        author: "Ann M",
        content:
            "Hey I am going on a road trip this weekend to Mumbai, contact me if you are interested.",
        datetime: DateTime.now(),
        pfpurl:
            "https://images.unsplash.com/photo-1526520112421-5054395689a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"));
    _cards.add(PostCard(
        uuid: "123",
        author: "Ashley Jain",
        content:
            "Is someone ineterested in coming to the Alan Walker concert with me",
        datetime: DateTime.now(),
        pfpurl:
            "https://images.unsplash.com/photo-1610766920689-5d4c57e1dfba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=864&q=80"));
    _cards.add(PostCard(
        uuid: "123",
        author: "Ivan Rossi",
        content:
            "There is party at home tomorrow, hmu if anyone is interested.",
        datetime: DateTime.now(),
        pfpurl:
            "https://qph.fs.quoracdn.net/main-thumb-357007265-200-uisgvhlwjfzgzxavvrhslbkuzsamytye.jpeg"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return _cards[index];
          }),
          itemCount: _cards.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}

//.

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
            checkPosts(context, pfpurl, author, "+919548120573", "Expert", 20,
                content, "Hindi, English, Nepali", "location");
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
                        width: 10,
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
