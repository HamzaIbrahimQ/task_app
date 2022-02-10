import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// App colors
const Color mainColor = Color(0xff1C8BF3);
const Color secondColor = Color(0xff208FF3);
const Color backgroundColor = Color(0xffFDFEFE);
const Color greyColor = Color(0xFFF0F1F5);


// Api links
String baseUrl = "https://rafiqi-backend.azurewebsites.net/api/";
String loginEnp = "Account/Login";
String categoriesEnp = "portal/categories/search";
String activitiesEnp = "portal/lesson/GetEventsByEventTypeId?EventTypeId=";
String coursesEnp = "portal/lesson/GetEventsByEventTypeId?EventTypeId=";




const List dropDownList = [
  '962+',
  '963+',
  '964+',
  '965+',
  '966+',
];

const List tabs = ['الرئيسية', 'طلباتي', 'الأقسام', 'حسابي'];
