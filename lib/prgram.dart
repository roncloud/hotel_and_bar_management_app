import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanage/LogIn.dart';
import 'package:hotelmanage/Signup.dart';

class Program extends StatefulWidget {
  @override
  _ProgramState createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
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
                    height: 40,
                  ),






                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text("MEET THE DEVELOPERS",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),),

                        ),
                  Card(
                    elevation: 7,

                    child:     Container(
                      height: 150,
                      width: 270,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(image: AssetImage('asset/images/P1.jpg'),
                        fit: BoxFit.cover
                        ),
                      ),



                    ),
                  ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 22),
                        child: Text("Mr. Ehiabhi Precious",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),),

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[

                          Column(
                            children: <Widget>[
                              Card(
                                elevation: 7,

                                child:     Container(
                                  height: 140,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(image: AssetImage('asset/images/G1.png'),
                                        fit: BoxFit.contain
                                    ),
                                  ),



                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text("Mr. Gbenga",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),),

                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Card(
                                elevation: 7,

                                child:     Container(
                                  height: 140,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(image: AssetImage('asset/images/T1.jpg'),
                                        fit: BoxFit.cover
                                    ),
                                  ),



                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text("Mr. Tobi",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),),

                              ),
                            ],
                          ),
                        ],
                      ),

                ],
              ),
                  ),
            ],
          ),
        ]),

      ),
    ),);
  }
}
