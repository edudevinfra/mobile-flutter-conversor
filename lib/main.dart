import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home()
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}