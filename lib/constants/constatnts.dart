import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// App colors
Color mainColor = const Color(0xff1C8BF3);
Color secondColor = const Color(0xff208FF3);
Color backgroundColor = const Color(0xffFDFEFE);
const greyColor = Color(0xFFF0F1F5);


// Api links
String baseUrl = "https://rafiqi-backend.azurewebsites.net/api/";
String loginEnp = "Account/Login";
String categoriesEnp = "portal/categories/search";
String activitiesEnp = "portal/lesson/GetEventsByEventTypeId?EventTypeId=";
String coursesEnp = "portal/lesson/GetEventsByEventTypeId?EventTypeId=";




List dropDownList = [
  '962+',
  '963+',
  '964+',
  '965+',
  '966+',
];
