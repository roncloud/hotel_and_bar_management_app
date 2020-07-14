import 'package:flutter/material.dart';
import 'package:hotelmanage/LogIn.dart';
import 'package:hotelmanage/Signup.dart';
import 'package:hotelmanage/prgram.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                    height: 50,
                  ),
                  Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("asset/images/book.png"),
                          fit: BoxFit.contain
                      ),

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
                  SizedBox(
                    height: 30,
                  ),
                  Text("Getting Information at your fingertips", style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold

                  ),),
                  Text("Fast - Safe - Accurate", style: TextStyle(
                      color: Colors.white,

                  ),),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.cyan
                    ),
                    child: FlatButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Signup();
                      }));
                    }, child: Text("Get Started",
                      style: TextStyle(color: Colors.white,
                      fontSize: 20),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: FlatButton(
                          splashColor: Color(0xFF00d6d9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),


                              side: BorderSide(

                                color: Color(0xFF4b39cc),

                              )
                          ),
                          color: Colors.amber,
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return LogIn();
                            }));
                          }, child: Text("Log In",
                        style: TextStyle(

                            color: Colors.black,
                            fontSize: 20
                        ),)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: FlatButton(
                          splashColor: Color(0xFF00d6d9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),


                              side: BorderSide(

                                color: Color(0xFF4b39cc),

                              )
                          ),
                          color: Colors.transparent,
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return Program();
                            }));
                          }, child: Text("Meet the Developers",
                        style: TextStyle(

                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),)),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Text("Reindeer Hotel Management App",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),

                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
