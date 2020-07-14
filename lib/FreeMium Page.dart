import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanage/Signup.dart';


FirebaseUser _user;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState(); 
}

class _HomeScreenState extends State<HomeScreen> {
  Firestore _db = Firestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  double income = 0;
  double expense = 0;
  double balance = 0;
  DateTime date;
  TextEditingController incomeController = TextEditingController();
  TextEditingController expensesController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void getUserDetails()async{
    final userProfile = await _auth.currentUser();
    if(userProfile != null){
      _user = userProfile;
    }
  }

  void sendReport()async{
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      getUserDetails();
      final file = await _db.collection("reports").add(
          {
            "incomes": incomeController.text,
            "expenses": expensesController.text,
//            "balances": balance,
//            "postby": _user.email,
          }
      );

//      Navigator.of(context).push(MaterialPageRoute(builder: (context){
//        return ;//homePage();
//      }));
    }
  }

//  TextEditingController desController1 = TextEditingController();
//  TextEditingController priceController1 = TextEditingController();
//  TextEditingController desController2 = TextEditingController();
//  TextEditingController priceController2 = TextEditingController();
//  TextEditingController desController3 = TextEditingController();
//  TextEditingController priceController3 = TextEditingController();
//  TextEditingController desController4 = TextEditingController();
//  TextEditingController priceController4 = TextEditingController();
//  TextEditingController desController5 = TextEditingController();
//  TextEditingController priceController5 = TextEditingController();
//  TextEditingController desController6 = TextEditingController();
//  TextEditingController priceController6 = TextEditingController();
//  TextEditingController desController7 = TextEditingController();
//  TextEditingController priceController7 = TextEditingController();
//  TextEditingController desController8 = TextEditingController();
//  TextEditingController priceController8 = TextEditingController();
//  TextEditingController desController9 = TextEditingController();
//  TextEditingController priceController9 = TextEditingController();
//  TextEditingController desController10 = TextEditingController();
//  TextEditingController priceController10 = TextEditingController();

//  double tprice = 0;


  void calculateEntry(){
    double inc = double.parse(incomeController.text.trim());
    double exp = double.parse(expensesController.text.trim());
//    double p1 = double.parse(priceController1.text.trim());
//    double p2 = double.parse(priceController2.text.trim());
//    double p3 = double.parse(priceController3.text.trim());
//    double p4 = double.parse(priceController4.text.trim());
//    double p5 = double.parse(priceController5.text.trim());
//    double p6 = double.parse(priceController6.text.trim());
//    double p7 = double.parse(priceController7.text.trim());
//    double p8 = double.parse(priceController8.text.trim());
//    double p9 = double.parse(priceController9.text.trim());
//    double p10 = double.parse(priceController10.text.trim());

    setState(() {
      double result = inc - exp;
      //double result = p1+p2+p3+p4+p5+p6+p7+p8+p9+p10;
      balance = result;
    });
  }

  // Entry for Expenses Controller
//  TextEditingController desControllerE1 = TextEditingController();
//  TextEditingController priceControllerE1 = TextEditingController();
//  TextEditingController desControllerE2 = TextEditingController();
//  TextEditingController priceControllerE2 = TextEditingController();
//  TextEditingController desControllerE3 = TextEditingController();
//  TextEditingController priceControllerE3 = TextEditingController();
//  TextEditingController desControllerE4 = TextEditingController();
//  TextEditingController priceControllerE4 = TextEditingController();
//  TextEditingController desControllerE5 = TextEditingController();
//  TextEditingController priceControllerE5 = TextEditingController();


//  double eprice = 0;

//  void calculateEEntry(){
//    double e1 = double.parse(priceControllerE1.text.trim());
//    double e2 = double.parse(priceControllerE2.text.trim());
//    double e3 = double.parse(priceControllerE3.text.trim());
//    double e4 = double.parse(priceControllerE4.text.trim());
//    double e5 = double.parse(priceControllerE5.text.trim());
//
//
//    setState(() {
//      double resulte = e1+e2+e3+e4+e5;
//      eprice = resulte;
//    });
//  }

//  double gprice = 0;
//
//  void calculateGPrice(){
//    gprice = tprice - eprice;
//  }


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
                      return Signup();
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
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(height: 20),

                Text("Income Entry"),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  validator: (value){
                    if(value.length < 1 ){
                      return "too short";
                    }
                    else{
                      return null;
                    }
                  },
                    onSaved: (val){
                      income = val as double;
                    },
                  controller: incomeController,
                    keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    hintText: "Enter Income",
                    labelText: "Income",
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 20)
                  )
                ),

                SizedBox(height: 20),

                Text("Expenses Entry"),

                SizedBox(height: 20),

                TextFormField(
                    autofocus: true,
                    validator: (value){
                      if(value.length < 1 ){
                        return "too short";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (val){
                      expense = val as double;
                    },
                    controller: expensesController,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        hintText: "Enter Expenses",
                        labelText: "Expenses",
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(left: 20)
                    )
                ),

//                TextFormField(
//                  autofocus: true,
//                  controller: desController1,
//                  decoration: InputDecoration(
//                      hintText: "Enter Description",
//                      labelText: "Description",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: priceController1,
//                  keyboardType: TextInputType.numberWithOptions(),
//                  decoration: InputDecoration(
//                      hintText: "Enter Price",
//                      labelText: "Price",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: desController2,
//                  decoration: InputDecoration(
//                      hintText: "Enter Description",
//                      labelText: "Description",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  keyboardType: TextInputType.numberWithOptions(),
//                  autofocus: true,
//                  controller: priceController2,
//                  decoration: InputDecoration(
//                      hintText: "Enter Price",
//                      labelText: "Price",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: desController3,
//                  decoration: InputDecoration(
//                      hintText: "Enter Description",
//                      labelText: "Description",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: priceController3,
//                  keyboardType: TextInputType.numberWithOptions(),
//                  decoration: InputDecoration(
//                      hintText: "Enter Price",
//                      labelText: "Price",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: desController4,
//                  decoration: InputDecoration(
//                      hintText: "Enter Description",
//                      labelText: "Description",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  keyboardType: TextInputType.numberWithOptions(),
//                  controller: priceController4,
//                  decoration: InputDecoration(
//                      hintText: "Enter Price",
//                      labelText: "Price",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),

//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: desController5,
//                  decoration: InputDecoration(
//                      hintText: "Enter Description",
//                      labelText: "Description",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  keyboardType: TextInputType.numberWithOptions(),
//                  controller: priceController5,
//                  decoration: InputDecoration(
//                      hintText: "Enter Price",
//                      labelText: "Price",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),


                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: (){
                    calculateEntry();
                  },
                  child: Text("Calculate Entry",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Text("${double.parse(balance.toStringAsFixed(2))}"),

                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: (){
                    sendReport();
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

            SizedBox(height: 5),

//            Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//
//                SizedBox(height: 20),
//
//                Text("Expenses Entry"),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: desControllerE1,
//                  decoration: InputDecoration(
//                      hintText: "Enter Description",
//                      labelText: "Description",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: priceControllerE1,
//                  keyboardType: TextInputType.numberWithOptions(),
//                  decoration: InputDecoration(
//                      hintText: "Enter Price",
//                      labelText: "Price",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: desControllerE2,
//                  decoration: InputDecoration(
//                      hintText: "Enter Description",
//                      labelText: "Description",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: priceControllerE2,
//                  keyboardType: TextInputType.numberWithOptions(),
//
//                  decoration: InputDecoration(
//                      hintText: "Enter Price",
//                      labelText: "Price",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: desControllerE3,
//                  decoration: InputDecoration(
//                      hintText: "Enter Description",
//                      labelText: "Description",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  keyboardType: TextInputType.numberWithOptions(),
//                  controller: priceControllerE3,
//                  decoration: InputDecoration(
//                      hintText: "Enter Price",
//                      labelText: "Price",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: desControllerE4,
//                  decoration: InputDecoration(
//                      hintText: "Enter Description",
//                      labelText: "Description",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: priceControllerE4,
//                  keyboardType: TextInputType.numberWithOptions(),
//                  decoration: InputDecoration(
//                      hintText: "Enter Price",
//                      labelText: "Price",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: desControllerE5,
//                  decoration: InputDecoration(
//                      hintText: "Enter Description",
//                      labelText: "Description",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                TextFormField(
//                  autofocus: true,
//                  controller: priceControllerE5,
//                  keyboardType: TextInputType.numberWithOptions(),
//                  decoration: InputDecoration(
//                      hintText: "Enter Price",
//                      labelText: "Price",
//                      filled: true,
//                      fillColor: Colors.white,
//                      border: InputBorder.none,
//                      contentPadding: const EdgeInsets.only(left: 20)
//                  ),
//                ),
//
//
//
//                RaisedButton(
//                  color: Colors.blue,
//                  textColor: Colors.white,
//                  onPressed: (){
//                    calculateEEntry();
//                  },
//                  child: Text("Calculate Income Entry",
//                    style: TextStyle(
//                      fontSize: 25,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                ),
//
//                SizedBox(height: 20),
//
//                Text("Total Expenses = ${double.parse(eprice.toStringAsFixed(2))}"),
//
//              ],
//            ),

//            SizedBox(height: 5),

//            Text("The Net Balance is ${double.parse(gprice.toStringAsFixed(2))}")
          ],
        ),
      ),

    );
  }
}


