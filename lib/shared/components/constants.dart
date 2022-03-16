import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:app_news/modules/business/business_screen.dart';
import 'package:app_news/modules/science/science_screen.dart';
import 'package:app_news/modules/setting/setting_screen.dart';
import 'package:app_news/modules/sport/sport_screen.dart';
import 'package:app_news/network/local/cache_helper.dart';
import 'package:app_news/shared/cubit/cubit.dart';


List<IconData> bottomNavIcons = [
  Icons.attach_money_rounded,
  Icons.science_rounded,
  Icons.sports_rounded,
  Icons.settings_rounded,

];

List<String> bottomNavItems = [
  'Business',
  'Science',
  'Sport',
  'Setting',
];

List<Widget> screens = const [
  BusinessScreen(),
  ScienceScreen(),
  SportScreen(),
  SettingScreen(),
];


