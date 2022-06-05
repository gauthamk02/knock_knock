import 'dart:async';

import 'package:flutter/material.dart';
import 'package:knock_knock/models/expert.dart';
import 'package:knock_knock/models/profiles.dart';
import 'package:knock_knock/widgets/event-block.dart';
import 'package:knock_knock/widgets/expert-block.dart';
import '../constants.dart';

class ExplorerDashboard extends StatefulWidget {
  const ExplorerDashboard({Key? key}) : super(key: key);

  @override
  State<ExplorerDashboard> createState() => _ExplorerDashboardState();
}

class _ExplorerDashboardState extends State<ExplorerDashboard> {
  void checkExperts(BuildContext context) {
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
                    Container(
                      height: 100,
                      width: 110,
                      // color: Colors.accents,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg"),
                            fit: BoxFit.fill,
                          )),
                    ),
                    Text("Name"),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Age: 10"),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        "sdfsdfadf a dfa df sd f  sdfs df  sd f sd f sd f sd f sd f  sd f sd f sd f    sd fs df sd f sd f sdf"),
                    SizedBox(
                      height: 19,
                    ),
                    Text("Language: Hindi, English"),
                    SizedBox(
                      height: 19,
                    ),
                    Text("Location"),
                    SizedBox(
                      height: 6,
                    ),
                    Text("contact: 34534534545")
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //ProfileProvider.getProfileByLoction("sdf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 35,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 10,
          )
        ],
        title: const Text("Explorer"),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                "Experts",
                textAlign: TextAlign.start,
                style: kTitleTextStyle,
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.3,
                // color: Colors.red,
                // child: ExpertBlock(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        child: ExpertBlock(),
                        onTap: () => checkExperts(context),
                      ),
                      ExpertBlock(),
                      ExpertBlock(),
                      ExpertBlock(),
                      ExpertBlock(),
                      ExpertBlock()
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              // Text(
              //   "Upcoming Events",
              //   textAlign: TextAlign.start,
              //   style: kTitleTextStyle,
              // ),
              SizedBox(
                height: 6,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.56,
                width: MediaQuery.of(context).size.width * 0.97,
                // color: Colors.green,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        EventBlock(),
                        EventBlock(),
                        EventBlock(),
                        EventBlock(),
                        EventBlock(),
                        EventBlock(),
                        EventBlock(),
                        EventBlock(),
                        EventBlock(),
                        EventBlock(),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
