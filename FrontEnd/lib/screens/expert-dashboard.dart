import 'package:flutter/material.dart';
import 'package:knock_knock/widgets/event-popup.dart';
import 'package:intl/intl.dart';
import '../widgets/explorer-block.dart';
import '../widgets/event-block.dart';

class ExpertDashboard extends StatefulWidget {
  const ExpertDashboard({Key? key}) : super(key: key);

  @override
  State<ExpertDashboard> createState() => _ExpertDashboardState();
}

class _ExpertDashboardState extends State<ExpertDashboard> {
  DateTime? _selectedDate;
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _amount = TextEditingController();

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

  void newEvent(BuildContext ctx) {
    final _formKey = GlobalKey<FormState>();
    showModalBottomSheet(
        //isScrollControlled = true
        context: context,
        builder: (context) {
          return Container(
            // height: MediaQuery.of(context).size.height * 0.4,
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              elevation: 8,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Add new Event!",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: TextFormField(
                              controller: _title,
                              decoration:
                                  const InputDecoration(labelText: "Title"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            // padding: EdgeInsets.all(1),
                            child: TextFormField(
                              maxLines: 3,
                              controller: _description,
                              decoration: const InputDecoration(
                                  labelText: "Description"),
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
                          TextButton(
                            onPressed: _datePicker,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: _datePicker,
                                    icon: const Icon(
                                        Icons.calendar_today_outlined)),
                                Text(
                                    _selectedDate == null
                                        ? "pick a date"
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
    return Scaffold(
      appBar: AppBar(
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
        title: const Text("Expert"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 2,
            ),
            Text("NearBy Explorers!"),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.4,
              // color: Colors.red,
              // child: ExpertBlock(),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ExplorerBlock(),
                    ExplorerBlock(),
                    ExplorerBlock(),
                    ExplorerBlock(),
                    ExplorerBlock(),
                    ExplorerBlock()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text("Your Events"),
            SizedBox(
              height: 10,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newEvent(context);
        },
        elevation: 20,
        child: Icon(
          Icons.add_location_rounded,
          size: 35,
        ),
      ),
    );
  }
}
