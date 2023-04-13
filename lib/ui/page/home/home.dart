import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:prototype/ui/component/bottom_navbar/bottom_navbar.dart";

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Placeholder(),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}