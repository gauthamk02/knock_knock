import 'package:flutter/material.dart';
import './screens/screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/signin': (context) => SignInPage(),
  '/register': (context) => RegisterPage()
};
