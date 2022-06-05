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
                          height: 139,
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
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                        height: MediaQuery.of(context).size.height * 0.11,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                        child: Text("About: \n$description")),
                    SizedBox(
                      height: 19,
                    ),
                    Text("City: $location          "),
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
        children: <Widget>[
          GestureDetector(
            child: ExpertBlock(
                "Anshuman Swain",
                "English, Hindi",
                "https://avatars.githubusercontent.com/u/90995338?v=4",
                "Kochi",
                "Expert"),
            onTap: () => checkExperts(
                context,
                "https://avatars.githubusercontent.com/u/90995338?v=4",
                "Anshuman Swain",
                "6238337639",
                "Expert",
                25,
                "Playful and intellectually curious, he is constantly juggling a variety of passions, hobbies, careers, and friend groups",
                "Hindi, engish",
                "Kochi"),
          ),
          GestureDetector(
            child: ExpertBlock(
                "Gaurav Sharma",
                "English, Hindi, French",
                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                "Kochi",
                "Explorer"),
            onTap: () => checkExperts(
                context,
                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                "Gaurav Sharma",
                "2345674567",
                "Explorer",
                35,
                "Playful and intellectually curious, he is constantly juggling a variety of passions, hobbies, careers, and friend groups",
                "Hindi, engish",
                "Kochi"),
          ),
          GestureDetector(
            child: ExpertBlock(
                "Joe Doe",
                "English, French,German",
                "https://images.unsplash.com/photo-1592992584424-bb6c75136025?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                "Kochi",
                "Explorer"),
            onTap: () => checkExperts(
                context,
                "https://images.unsplash.com/photo-1592992584424-bb6c75136025?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                "Joe Doe",
                "2345674567",
                "Explorer",
                30,
                "Playful and intellectually curious, he is constantly juggling a variety of passions, hobbies, careers, and friend groups",
                "Hindi, engish",
                "Kochi"),
          ),
          GestureDetector(
            child: ExpertBlock(
                "Jessica H",
                "English,Malayalam",
                "https://images.unsplash.com/photo-1518577915332-c2a19f149a75?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2062&q=80",
                "Kochi",
                "Expert"),
            onTap: () => checkExperts(
                context,
                "https://images.unsplash.com/photo-1518577915332-c2a19f149a75?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2062&q=80",
                "Kabir Singh Khan",
                "2345674567",
                "Expert",
                34,
                "Playful and intellectually curious, he is constantly juggling a variety of passions, hobbies, careers, and friend groups",
                "Hindi, engish",
                "Kochi"),
          ),
          GestureDetector(
            child: ExpertBlock(
                "Ivan Rossi",
                "English,Malayalam",
                "https://images.unsplash.com/photo-1618077360395-f3068be8e001?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                "Kochi",
                "Explorer"),
            onTap: () => checkExperts(
                context,
                "https://images.unsplash.com/photo-1618077360395-f3068be8e001?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                "Ivan Rossi",
                "2345673567",
                "Explorer",
                25,
                "Playful and intellectually curious, he is constantly juggling a variety of passions, hobbies, careers, and friend groupsr",
                "Hindi, engish",
                "Kochi"),
          ),
          GestureDetector(
            child: ExpertBlock(
                "Elon Musk",
                "English",
                "https://media.gq.com/photos/566ac3fec0f741b430e641e7/master/pass/elon-musk-gq-1215-01-sq.jpg",
                "Kochi",
                "Expert"),
            onTap: () => checkExperts(
                context,
                "https://media.gq.com/photos/566ac3fec0f741b430e641e7/master/pass/elon-musk-gq-1215-01-sq.jpg",
                "Name Singh Khan",
                "2345674567",
                "Expert",
                45,
                "Playful and intellectually curious, he is constantly juggling a variety of passions, hobbies, careers, and friend groups",
                "Hindi, engish",
                "Kochi"),
          ),
          GestureDetector(
            child: ExpertBlock(
                "Tim Cook",
                "English, Hindi",
                "https://global-uploads.webflow.com/5dfd5aca7badfa129f80056c/5ed6d2e60331fd5be59cef4c_5ed5901b8c8b1f3f205e088e_63O1znGw_400x400.jpeg",
                "Kochi",
                "Explorer"),
            onTap: () => checkExperts(
                context,
                "https://global-uploads.webflow.com/5dfd5aca7badfa129f80056c/5ed6d2e60331fd5be59cef4c_5ed5901b8c8b1f3f205e088e_63O1znGw_400x400.jpeg",
                "Tim Cook",
                "2345674567",
                "Explorer",
                29,
                "Playful and intellectually curious, he is constantly juggling a variety of passions, hobbies, careers, and friend groups",
                "Hindi, engish",
                "Kochi"),
          ),
          ExpertBlock(
              "Larry Page",
              "English, French",
              "https://upload.wikimedia.org/wikipedia/commons/e/ec/Larry_Page_in_the_European_Parliament%2C_17.06.2009_%28cropped%29.jpg",
              "Kochi",
              "Explorer"),
        ],
      ),
    );
  }
}
