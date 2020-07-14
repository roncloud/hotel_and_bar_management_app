import 'dart:async';


import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanage/MyHomePage.dart';


class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Timer(Duration(seconds: 5), () {
      return Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return MyHomePage();
      }));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/images/P2.jpg"),
                        fit: BoxFit.cover
                    )
                ),
              ),Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFF4b39cc).withOpacity(.8),
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    /*decoration: BoxDecoration(
                      color: Colors.red.withOpacity(.4),
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("asset/images/P2.jpg"),
                          fit: BoxFit.cover
                      ),
*/
                    child: FlareActor("asset/images/Loading.flr",
                      fit: BoxFit.contain,
                      animation: "Alarm",
                    ),
                  ),








                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Welcome to Reindeer ", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),),
                        Column(
                          children: <Widget>[
                            Text(" Hotel Management App", style: TextStyle(
                                color: Color(0xff00d6d9),
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),),

                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,


                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: FlatButton(

                        splashColor: Colors.cyanAccent,
                        shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                                color: Colors.white
                            )
                        ),
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return MyHomePage();
                          }));
                        }, child: Text("Go to Next Page",
                      style: TextStyle(
                          color: Colors.white
                      ),)),
                  )


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
