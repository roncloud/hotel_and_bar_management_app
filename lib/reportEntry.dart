import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanage/LogIn.dart';

// Get user detail from firebase
FirebaseUser _user;

class reportEntry extends StatefulWidget {
  @override
  _reportEntryState createState() => _reportEntryState();
}

class _reportEntryState extends State<reportEntry> {
  // Connecting to firestore
  Firestore firestore = Firestore.instance;

  // Connecting to firebase authentication
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Creating value entry controller
  TextEditingController incomeController = TextEditingController();
  TextEditingController expenseController = TextEditingController();

  // Creating a variable for value entered
  double income;
  double expense;
  double balance;

  // Retrieving current user email
  void getUser()async{
    final userProfile = await _auth.currentUser();
    if(userProfile != null){
      _user = userProfile;
    }
  }

  // Making an initState for the retieved user
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.person, color: Colors.white,),
            onPressed: (){

            }),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: ()async{
                await _auth.signOut().then((onValue){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return LogIn();
                  }));
                }).catchError((onError){
                  print(onError);
                });
              },
              icon: Icon(Icons.clear, color: Colors.white,),
              label: Text("Log Out",
                style: TextStyle(
                  color: Colors.white,
                ),))
        ],
        centerTitle: false,
        title: Text('Hotel Mgt App',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15
          ),
        ),

      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Todays Report",
                style: TextStyle(
                  fontSize: 45
                ),
              ),

              SizedBox(height: 20,),

              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  hintText: "Enter Incomes",
                  labelText: "Incomes",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 20),
                  fillColor: Colors.blue[50],
                  filled: true,
                ),
                controller: incomeController,
                onChanged: (value){
                  income = value as double;
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  hintText: "Enter Expenses",
                  labelText: "Expenses",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 20),
                  fillColor: Colors.blue[50],
                  filled: true,
                ),
                controller: expenseController,
                onChanged: (value){
                  income = value as double;
                },
              ),

              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: ()async{

                  // Creating a setstate that parse the and calculate
                  // the income and expenses to produce a balance
                  setState(() {
                    // converting the text to a number in double format
                    double inc = double.parse(incomeController.text.trim());
                    double exp = double.parse(expenseController.text.trim());

                    // Calculating the difference between the income
                    // and expenses
                    double result = inc - exp;
                    income = inc;
                    expense = exp;
                    balance = result;
                  });
                },
                child: Text("Calculate Entry",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 20),

              Text("$balance"),
              // .toStringAsFixed(2)
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: ()async{
                  if (income != null || expense != null){
                    await firestore.collection('reports').add({
                      "income": income,
                      "expenses": expense,
                      "balance": balance,
                      "postby": _user.email,
                    });
                    incomeController.clear();
                    expenseController.clear();
                    income = null;
                    expense = null;
                  } else {
                    incomeController.clear();
                    expenseController.clear();
                  }
                },
                child: Text("Send Report",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
