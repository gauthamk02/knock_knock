import 'dart:convert';

import 'package:flutter/material.dart';

class User {
  final String? id;
  final String name;
  final String bio;
  final String number;
  final String age;
  // final String language;
  final String profileUrl =
      "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAATlBMVEXw8PBy2m328fZv2mry8PJp2WOM3onZ69iS34/V69Te7N1s2Wf18fVm2GHb7NqG3YLq7+pf2FmJ3YX88vx93HmQ342l4qLG6MW/5r2g4Z0Pms1EAAAB9ElEQVR4nO3ca3LTYAyG0ZCLc3WTurTA/jcKKyDvMPqM2jnPAhQdz+Sfrc1GkiRJkiT9pX3WyqMK21+OSY9gr8JRlW2n+fC813OwVuGoyran3bfnHSJh3ajKCAnHjKqMkHDMqMoICceMqoyQcMyoyggJx4yqjJBwzKjKCAnHjKqMkHDMqMoICceMqoyQcMyoyggJx4yq7FML99ugt9N197z5uO6o7S0CXqZT0Pcp6L6sO+r9IyHuj3PwSK/TW/BIL2uPWraR8BD8LXZTMKvnqKZrERL2X4uQsP9ahIT91yIk7L8WIWH/tQgJ+69FSNh/LULC/msREvZfi5Cw/1qEhP806/mdh9vL+qMi4Wtw4mC+B7ceXn5ck7WyUcnhhfkeCR/noOOS/GIC/EMMJh3mn9FadadGstd8Cjucb8leCTDrPwhbvvVFSEhISEhISEhISEhISEhISEhISEhISEhISEhI+CWE78mph8LmtYW3jyW59VDXPXsJoZKYHOKobG2gJEmSJEmSJEmSJOlzFH2Q37QI+Hh+w6Ftl4SY3cXoWXgXI7pt0rPK6y09IyTsHyFh/wgJ+0dI2D9Cwv4REvaPkLB/hIT9IyTsHyFh/wgJ+5cK53XvQRR2XSLh5b7uPYjCll+3QLjZr30PorAIKEmSJEnSV+w3VSaQaiTKUxQAAAAASUVORK5CYII=";
  // final double? ratings;
  final String location;
  final String type;
  // final int? ratingCount;

  User(this.id, this.name, this.bio, this.number, this.age, this.location,
      this.type);

  static User userFromJSONString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return User(
      json['id'],
      json['name'],
      json['bio'],
      json['number'],
      json['age'],
      json['location'],
      json['type'],
    );
  }
}

class UserProvider with ChangeNotifier {
  static User? user;

  static Future<void> setUser(User newUser) async {
    user = newUser;
  }
}
