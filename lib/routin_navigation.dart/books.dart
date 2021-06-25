import 'package:flutter/material.dart';

class Books {
  final String id;
  final String title;
  final String name;
  final String detail;
  final Color color;

  const Books({
    required this.id,
    required this.title,
    this.color = Colors.redAccent,
    required this.name,
    required this.detail,
  });
}
