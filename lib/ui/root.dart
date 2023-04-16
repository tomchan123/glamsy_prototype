import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/ui/page/history/history.dart';
import 'package:prototype/ui/page/home/home.dart';
import 'package:prototype/ui/page/profile/profile.dart';
import 'package:prototype/ui/page/booking/booking.dart';
import 'package:prototype/ui/theme/theme_data.dart';

class Root extends StatelessWidget {
const Root({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomePage(),
      theme: AppTheme.mainTheme,
    );
  }
}