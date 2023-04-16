import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/ui/page/history/history.dart';
import 'package:prototype/ui/page/home/home.dart';
import 'package:prototype/ui/page/profile/profile.dart';
import 'package:prototype/ui/page/booking/booking.dart';
import 'package:prototype/ui/theme/theme_data.dart';
import "package:prototype/ui/component/bottom_navbar/bottom_navbar.dart";

class Root extends StatefulWidget {
  const Root({ Key? key }) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: "/",
      theme: AppTheme.mainTheme,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case "/":
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => 
                HomePage()
            );
          case "/booking":
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => 
                BookingPage()
            );
          default: 
            return null;
        }
      },
    );
  }

}