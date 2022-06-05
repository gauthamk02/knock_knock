import 'package:flutter/material.dart';
import 'package:knock_knock/screens/people-screen.dart';
import 'package:knock_knock/screens/post-screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 40,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.panorama_wide_angle_select_rounded),
                ),
                Tab(
                  icon: Icon(Icons.supervisor_account),
                )
              ],
            ),
            title: Text("Knock Knock"),
            elevation: 2,
            actions: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.account_circle_outlined))
            ],
          ),
          body: TabBarView(
            children: [PostPage(), PeopleScreen()],
          ),
        ));
  }
}
