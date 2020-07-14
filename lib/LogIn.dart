//color-cyan: 0xff00d6d9
//color-blue: 0xFF4b39cc

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanage/FreeMium%20Page.dart';
import 'package:hotelmanage/MyHomePage.dart';
import 'package:hotelmanage/Signup.dart';
import 'package:hotelmanage/portalScreen.dart';
import 'package:hotelmanage/reportEntry.dart';
import 'package:hotelmanage/viewReport.dart';
import 'package:hotelmanage/welcome.dart';


class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalKey <FormState> formkey = GlobalKey<FormState>();
  TextEditingController econtroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();

  void login(){
    final form = formkey.currentState;
    if(form.validate()){
      form.save();
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return LogIn();
      }));
    }

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
                        image: AssetImage("asset/images/P1.jpg"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
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
                        Text("Welcome back to Reindeer ", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                        Column(
                          children: <Widget>[
                            Text(" Hotel Management App", style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),),

                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Log Into ", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),),
                      Column(
                        children: <Widget>[
                          Text(" Your Account", style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                          Container(
                            height: 3,
                            width: 0,
                            decoration: BoxDecoration(
                                color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  Form(
                    key: formkey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.8),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextFormField(
                              controller: econtroller,

                              validator: (val){
                                if(!val.contains("@")){
                                  return "Incorrect Email";
                                }
                                else if(!val.contains(".")){
                                  return "Incorrect Email";
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(

                                  contentPadding: EdgeInsets.all(10),
                                  border: InputBorder.none,
                                  labelText: "E-mail",
                                  hintText: "E-mail Address"

                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.8),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextFormField(
                              controller: pcontroller,
                              obscureText: true,
                              validator: (val){
                                if(val.length<=6){
                                  return "Password is too Short";
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                border: InputBorder.none,
                                labelText: "Password",
                                hintText: "Password",


                              ),
                            ),
                          ),
                        ),

                        RaisedButton(
                            color: Colors.amberAccent,
                            textColor: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15, bottom: 15),
                              child: Text("Log In",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  )),
                            ),
                            onPressed: () async{
                              try{
                                await _auth.signInWithEmailAndPassword
                                  (email: econtroller.text.trim(),
                                    password: pcontroller.text.trim())
                                    .then((onValue){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                    return portalScreen();//reportEntry();//viewReprot();//HomeScreen();
                                  }));
                                }).catchError((error)=>print(error));
                              }
                              catch(e){
                                print(e);
                              }
                            }),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      Text("Don't Have an Account?", style: TextStyle(
                          color: Colors.white,

                          fontSize: 15
                      ),),
                      FlatButton(

                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return Signup();
                          }));
                        }, child: Text("Register ", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),),
                    ],
                  ),
                  /* Padding(
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
*/

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
