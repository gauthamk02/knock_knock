import 'package:flutter/material.dart';

class ExpertDashboard extends StatefulWidget {
  const ExpertDashboard({Key? key}) : super(key: key);

  @override
  State<ExpertDashboard> createState() => _ExpertDashboardState();
}

class _ExpertDashboardState extends State<ExpertDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.account_circle_outlined,
            size: 35,
          ),
          SizedBox(
            width: 10,
          )
        ],
        title: const Text("Expert"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 2,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.2,
              color: Colors.red,
            ),
            SizedBox(
              height: 10,
            ),
            const Text("Your Events"),
            SizedBox(
              height: 10,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.45,
                color: Colors.green)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 20,
        child: Icon(
          Icons.add_location_rounded,
          size: 35,
        ),
      ),
    );
  }
}
