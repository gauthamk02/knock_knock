import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:knock_knock/widgets/expert-block.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  void checkExperts(
      BuildContext context,
      String imgUrl,
      String name,
      String phoneNo,
      String type,
      int age,
      String description,
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
                        child: Text("Bio: \n$description")),
                    SizedBox(
                      height: 19,
                    ),
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
    return Container(
      child: GridView(
        children: <Widget>[
          GestureDetector(
            child: ExpertBlock(
                "Anshuman Swain",
                "English, Hindi",
                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
                "Kochi",
                "Expert"),
            onTap: () => checkExperts(
                context,
                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
                "Anshuman Swain",
                "2345674567",
                "Expert",
                25,
                "Playful and intellectually curious, he is constantly juggling a variety of passions, hobbies, careers, and friend groups",
                "Hindi, engish",
                "Kochi"),
          ),
          GestureDetector(
            child: ExpertBlock(
                "Anshuman Swain",
                "English, Hindi",
                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
                "Kochi",
                "Explorer"),
            onTap: () => checkExperts(
                context,
                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
                "Name Singh Khan",
                "2345674567",
                "Explorer",
                35,
                "Playful and intellectually curious, he is constantly juggling a variety of passions, hobbies, careers, and friend groups",
                "Hindi, engish",
                "Delhi"),
          ),
          GestureDetector(
            child: ExpertBlock(
                "Anshuman Swain",
                "English, Hindi",
                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
                "Kochi",
                "Explorer"),
            onTap: () => checkExperts(
                context,
                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
                "Name Singh Khan",
                "2345674567",
                "Explorer",
                30,
                "descripf and sdk dfnwd f efnkejrg efb dgbjne grbbnedkjrg erkjvevn ergkn vkejv evjkevne rvn vekjrnvj rfnnervjner",
                "Hindi, engish",
                "Kaatmandu"),
          ),
          GestureDetector(
            child: ExpertBlock(
                "Anshuman Swain",
                "English, Hindi",
                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
                "Kochi",
                "Expert"),
            onTap: () => checkExperts(
                context,
                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
                "Name Singh Khan",
                "2345674567",
                "Expert",
                34,
                "descripf and sdk dfnwd f efnkejrg efb dgbjne grbbnedkjrg erkjvevn ergkn vkejv evjkevne rvn vekjrnvj rfnnervjner",
                "Hindi, engish",
                "Kochi"),
          ),
          GestureDetector(
            child: ExpertBlock(
                "Anshuman Swain",
                "English, Hindi",
                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
                "Kochi",
                "Explorer"),
            onTap: () => checkExperts(
                context,
                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
                "Name Singh Khan",
                "2345674567",
                "Explorer",
                25,
                "descripf and sdk dfnwd f efnkejrg efb dgbjne grbbnedkjrg erkjvevn ergkn vkejv evjkevne rvn vekjrnvj rfnnervjner",
                "Hindi, engish",
                "Kochi"),
          ),
          GestureDetector(
            child: ExpertBlock(
                "Anshuman Swain",
                "English, Hindi",
                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
                "Kochi",
                "Expert"),
            onTap: () => checkExperts(
                context,
                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
                "Name Singh Khan",
                "2345674567",
                "Expert",
                45,
                "descripf and sdk dfnwd f efnkejrg efb dgbjne grbbnedkjrg erkjvevn ergkn vkejv evjkevne rvn vekjrnvj rfnnervjner",
                "Hindi, engish",
                "Kochi"),
          ),
          GestureDetector(
            child: ExpertBlock(
                "Anshuman Swain",
                "English, Hindi",
                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
                "Kochi",
                "Explorer"),
            onTap: () => checkExperts(
                context,
                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
                "Name Singh Khan",
                "2345674567",
                "Explorer",
                29,
                "descripf and sdk dfnwd f efnkejrg efb dgbjne grbbnedkjrg erkjvevn ergkn vkejv evjkevne rvn vekjrnvj rfnnervjner",
                "Hindi, engish",
                "Kochi"),
          ),
          ExpertBlock(
              "Anshuman Swain",
              "English, Hindi",
              "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg",
              "Kochi",
              "Explorer"),
        ],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
      ),
    );
  }
}
