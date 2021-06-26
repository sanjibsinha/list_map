import 'package:flutter/material.dart';

class Books {
  final String id;
  final List<String> categories;
  final String title;
  final String detail;
  final Color color;

  const Books({
    required this.id,
    required this.categories,
    required this.title,
    required this.detail,
    this.color = Colors.redAccent,
  });
}
