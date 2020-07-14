import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanage/LogIn.dart';
import 'package:hotelmanage/MyHomePage.dart';
import 'package:hotelmanage/welcome.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalKey<FormState>formy = GlobalKey<FormState>();
  TextEditingController fname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cemail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  void SignUp(){
    final form = formy.currentState;
    if(form.validate()){
      form.save();
      Navigator.push(context, MaterialPageRoute(builder: (context){
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
                        image: AssetImage("asset/images/P2.jpg"),
                        fit: BoxFit.cover
                    )
                ),
              ),Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent.withOpacity(.77),
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    width: 100,
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
                            fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                        Column(
                          children: <Widget>[
                            Text(" Hotel Management App", style: TextStyle(
                                color: Colors.cyanAccent,
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
                      Text("Become ", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),),
                      Column(
                        children: <Widget>[
                          Text(" a Member", style: TextStyle(
                              color: Colors.cyanAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                          Container(
                            height: 3,
                            width: 10,
                            decoration: BoxDecoration(
                                color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Form(
                    key: formy,
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
                              validator: (val){
                                if(val.length <= 3){
                                  return "Input a Name";
                                }
                                else{
                                  return null;
                                }
                              },
                              controller: fname,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: InputBorder.none,
                                  labelText: "Hotel Name",
                                  hintText: "Hotel's Name"

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
                              controller: email,
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
                              validator: (val){
                                if(val.length <= 6){
                                  return "Password Too Short";
                                }
                                else if(val.length == 0){
                                  return "Input Password";
                                }
                                else{
                                  return null;
                                }
                              },
                              controller: password,

                              obscureText: true,
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
            color: Colors.cyan,
            textColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text("Register",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
            ),
            onPressed: ()async{
              try{
                await _auth.createUserWithEmailAndPassword
                  (email: email.text.trim(),
                    password: password.text.trim())
                    .then((onValue){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return MyHomePage();
                  }));
                }).catchError((error)=>print(error));
              }
              catch(e){
                print(e);
              }
            }
        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already Have an Account?", style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),),
                      FlatButton(

                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return LogIn();
                          }));
                        }, child: Text("Log In ", style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
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
