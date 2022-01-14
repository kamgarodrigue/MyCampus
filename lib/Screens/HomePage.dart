import 'package:flutter/material.dart';
import 'package:mycampus/Api/AuthService.dart';
import 'package:mycampus/Constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading:
            Image.asset("assets/images/logoApp.png", height: 100, width: 100),
        actions: [
          IconButton(
              onPressed: () {
                AuthService().logout();
              },
              icon: Icon(
                Icons.menu,
                color: kPrimaryColors,
              ))
        ],
      ),
      body: Container(),
    );
  }
}
