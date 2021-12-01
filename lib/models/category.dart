import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'question.dart';

class Category {
  String categoryName;
  List<Question> questions;
  String imageUrl;
  IconData? icon;
  String? description;
  Color? backgroundColor;

  Category({
    required this.categoryName,
    required this.questions,
    required this.imageUrl,
    this.icon = FontAwesomeIcons.question,
    this.description = "",
    this.backgroundColor = Colors.orange,
  });
}
