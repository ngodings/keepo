import 'package:flutter/material.dart';

class CustomTabItem<T> {
  final Widget icon;
  final String? title;
  final String? count;
  final String? key;

  const CustomTabItem({
    required this.icon,
    this.title,
    this.count,
    this.key,
  });
}
