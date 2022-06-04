import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knock_knock/screens/expert-dashboard.dart';
import 'package:knock_knock/screens/explorer-dashboard.dart';
import 'constants.dart';
import './screens/screen.dart';
import './screens/register_page.dart';
import './navigator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      // MultiProvider(
      //   providers:[

      //   ]
      //   ,child:MyApp())
      MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Knocknock',
      theme: AppTheme(context),
      home: ExplorerDashboard(),
      // initialRoute: '/signin',
      routes: routes,
    );
  }
}

ThemeData AppTheme(BuildContext context) {
  return ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
    scaffoldBackgroundColor: kBackgroundColor,
    primarySwatch: Colors.teal,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
