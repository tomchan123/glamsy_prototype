import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/ui/page/history/history.dart';
import 'package:prototype/ui/page/home/home.dart';
import 'package:prototype/ui/page/profile/profile.dart';
import 'package:prototype/ui/page/reservation/reservation.dart';
import 'package:prototype/ui/theme/theme_data.dart';

class Root extends StatelessWidget {
const Root({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      routes: {
        "/": (context) => HomePage(),
        "/reservation": (context) => ReservationPage(),
        "/history": (context) => HistoryPage(),
        "/profile": (context) => ProfilePage(),
      },
      theme: AppTheme.mainTheme,
    );
  }
}