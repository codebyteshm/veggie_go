import 'package:flutter/material.dart';

class FilterModel {
  FilterModel(
      {required this.image, required this.name, required this.widget});

  String image;
  String name;
  Widget widget;
}