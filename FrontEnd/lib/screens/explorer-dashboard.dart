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
                  children: [
                    Container(
                      height: 45,
                      width: 40,
                      // color: Colors.accents,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://images.shiksha.com/mediadata/images/articles/1583747992phpzaxKKK.jpeg"),
                            fit: BoxFit.fill,
                          )),
                    )
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
    ProfileProvider.getProfileByLoction("sdf");
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
                height: MediaQuery.of(context).size.height * 0.4,
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
              Text(
                "Upcoming Events",
                textAlign: TextAlign.start,
                style: kTitleTextStyle,
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.38,
                width: MediaQuery.of(context).size.width * 0.94,
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
