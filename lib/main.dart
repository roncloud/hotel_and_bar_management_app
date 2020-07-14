import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanage/FreeMium%20Page.dart';
import 'package:hotelmanage/MyHomePage.dart';
import 'package:hotelmanage/portalScreen.dart';
import 'package:hotelmanage/prgram.dart';
import 'package:hotelmanage/welcome.dart';
import 'package:hotelmanage/welcome.dart';


main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "CaviarDreams",
          primaryColor: Colors.blue,
          canvasColor: Colors.white
      ),
      home: stateManagement(),
    );
  }

  Widget stateManagement(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshot.hasData){
          return HomeScreen();
        }
        else{
          return portalScreen();
        }
      },
    );
  }
}
