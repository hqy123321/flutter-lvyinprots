

import 'package:flutter/material.dart';

Color iconsColor = Colors.green[400];

List<Map> imgList = [                  ///轮播图数据
    {
      "url" : "images/banner4.jpg"
    },
    {
      "url" : "images/banner3.jpg"
    },
    {
      "url" : "images/banner2.jpg"
    },
    {
      "url" : "images/banner1.jpg"
    },
  ];

  List<Map> ballFightList = [
    {
      "title" : "全部", "icons": Icon(Icons.hourglass_empty, color: iconsColor,)
    },
    {
      "title" : "报名中", "icons": Icon(Icons.assignment, color: iconsColor,)
    },
    {
      "title" : "比赛中", "icons": Icon(Icons.restore, color: iconsColor,)
    },
    {
      "title" : "已结束", "icons": Icon(Icons.remove_circle_outline, color: iconsColor,)
    },
  ];