import 'package:flutter/material.dart';
import 'package:knock_knock/screens/people-screen.dart';
import 'package:knock_knock/screens/post-screen.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime? _selectedDate;
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _amount = TextEditingController();
  bool _isEvent = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _title.dispose();
    _description.dispose();
    _amount.dispose();
  }

  void _datePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2025))
        .then((datePicked) {
      if (datePicked == null) {
        return;
      }
      setState(() {
        _selectedDate = datePicked;
      });
    });
  }

  void newPost(BuildContext ctx) {
    final _formKey = GlobalKey<FormState>();
    showModalBottomSheet(
        //isScrollControlled = true
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(4),
            // height: MediaQuery.of(context).size.height * 0.4,
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              elevation: 8,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "New Post!",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       bottom:
                          //           MediaQuery.of(context).viewInsets.bottom),
                          //   child: TextFormField(
                          //     controller: _title,
                          //     decoration:
                          //         const InputDecoration(labelText: "Title"),
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            // padding: EdgeInsets.all(1),
                            child: TextFormField(
                              maxLines: 2,
                              controller: _description,
                              decoration:
                                  const InputDecoration(labelText: "Message"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Row(
                              children: [
                                Text("Event"),
                                Switch(
                                  value: _isEvent,
                                  onChanged: (val) {
                                    setState(() {
                                      _isEvent = val;
                                      print(val);
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.all(8.0),
                          //   child: TextFormField(
                          //     controller: _amount,
                          //     keyboardType: TextInputType.number,
                          //     decoration: const InputDecoration(
                          //         labelText: "Amount(0 if free!)"),
                          //   ),
                          // ),
                          _isEvent == false
                              ? SizedBox(
                                  height: 1,
                                )
                              : TextButton(
                                  onPressed: _datePicker,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: _datePicker,
                                          icon: const Icon(
                                              Icons.calendar_today_outlined)),
                                      Text(
                                          _selectedDate == null
                                              ? "Schedule a date"
                                              : DateFormat('dd-MM-yyyy')
                                                  .format(_selectedDate!),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  // textColor: Theme.of(context).primaryColor,
                                ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: Text("Submit"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print("sdf");
              newPost(context);
            },
            child: Icon(Icons.add),
          )),
    );
  }
}
