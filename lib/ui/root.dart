import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/core/model/store.dart';
import 'package:prototype/ui/page/booking/book_staff.dart';
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
          case "/book-staff":
            return MaterialPageRoute(
              builder: (context) => 
                BookStaffPage(settings.arguments as Store)
            );
          case "/history":
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => 
                HistoryPage()
            );
          case "/profile":
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => 
                ProfilePage()
            );
          default: 
            return null;
        }
      },
    );
  }

}