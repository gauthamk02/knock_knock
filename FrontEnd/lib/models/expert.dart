import 'package:flutter/material.dart';

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
  List<Expert> _experts = [];

  List<Expert> get experts {
    return [..._experts];
  }
  // TODO addExpert
  //
}
