import 'package:flutter/material.dart';
import 'package:flutter_project/play.dart';

import 'Audiopick.dart';

void main() {
  runApp(MaterialApp(home: Audiopick()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GestureDetector(
      //  onTap: ()=>
      //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>),),
        child: Center(
          child: Container(
          child:Text("click"),
          ),
        ),
      ),

    );
  }}