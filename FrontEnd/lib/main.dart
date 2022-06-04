import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'constants.dart';
import './navigator.dart';

void main() async {
  await dotenv.load();
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

      //home: ExplorerDashboard(),
      initialRoute: '/register',
      routes: routes,
    );
  }
}

ThemeData AppTheme(BuildContext context) {
  return ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        .copyWith(bodyText1: kBodyText1, bodyText2: kBodyText2),
    // textTheme: TextTheme(bodyLarge: kSubheadingtextStyle, bodyText1: kBodyText),
    scaffoldBackgroundColor: kBackgroundColor,
    primarySwatch: Colors.teal,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
