import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:flutter/services.dart';
import 'dart:convert';

class Expert {
  final String? id;
  final String name;
  final String bio;
  final int age;
  final String language;
  final String? profileUrl;
  final double? ratings;
  final String location;
  final int? ratingCount;

  Expert(this.id, this.name, this.bio, this.age, this.language, this.profileUrl,
      this.ratings, this.location, this.ratingCount);
}

class ExpertProvider with ChangeNotifier {
  static List<Expert> _experts = [];

  static List<Expert> get experts {
    return [..._experts];
  }

  static Future<void> getData() async {
    final response = await rootBundle.loadString('./assets/expert.json');
    // print("ASD: $response");
    var data = json.decode(response) as List<dynamic>;
    print("Second: ${data[0]['uuid']}");
    for (int i = 0; i < data.length; i++) {
      _experts.add(Expert(data[0]['uuid'], data[0]['uuid'], data[0]['uuid'], data[0]['uuid'], data[0]['uuid'],data[0]['uuid'],data[0]['uuid'],
          data[0]['uuid'], data[0]['uuid']));
    }
  }
}
