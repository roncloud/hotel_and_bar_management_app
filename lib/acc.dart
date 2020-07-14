import 'package:flutter/material.dart';
class reportEntry extends StatefulWidget {

  @override
  _reportEntryState createState() => _reportEntryState();
}

class _reportEntryState extends State<reportEntry> {

  // Entry for Income Controller
  TextEditingController desController1 = TextEditingController();
  TextEditingController priceController1 = TextEditingController();
  TextEditingController desController2 = TextEditingController();
  TextEditingController priceController2 = TextEditingController();
  TextEditingController desController3 = TextEditingController();
  TextEditingController priceController3 = TextEditingController();
  TextEditingController desController4 = TextEditingController();
  TextEditingController priceController4 = TextEditingController();
  TextEditingController desController5 = TextEditingController();
  TextEditingController priceController5 = TextEditingController();


  double tprice = 0;


  void calculateEntry(){
    double p1 = double.parse(priceController1.text.trim());
    double p2 = double.parse(priceController2.text.trim());
    double p3 = double.parse(priceController3.text.trim());
    double p4 = double.parse(priceController4.text.trim());
    double p5 = double.parse(priceController5.text.trim());


    setState(() {
      double result = p1+p2+p3+p4+p5;
      tprice = result;
    });
  }

  // Entry for Expenses Controller
  TextEditingController desControllerE1 = TextEditingController();
  TextEditingController priceControllerE1 = TextEditingController();
  TextEditingController desControllerE2 = TextEditingController();
  TextEditingController priceControllerE2 = TextEditingController();
  TextEditingController desControllerE3 = TextEditingController();
  TextEditingController priceControllerE3 = TextEditingController();
  TextEditingController desControllerE4 = TextEditingController();
  TextEditingController priceControllerE4 = TextEditingController();
  TextEditingController desControllerE5 = TextEditingController();
  TextEditingController priceControllerE5 = TextEditingController();
  TextEditingController desControllerE6 = TextEditingController();
  TextEditingController priceControllerE6 = TextEditingController();
  TextEditingController desControllerE7 = TextEditingController();
  TextEditingController priceControllerE7 = TextEditingController();
  TextEditingController desControllerE8 = TextEditingController();
  TextEditingController priceControllerE8 = TextEditingController();
  TextEditingController desControllerE9 = TextEditingController();
  TextEditingController priceControllerE9 = TextEditingController();
  TextEditingController desControllerE10 = TextEditingController();
  TextEditingController priceControllerE10 = TextEditingController();

  double eprice = 0;

  void calculateEEntry(){
    double e1 = double.parse(priceControllerE1.text.trim());
    double e2 = double.parse(priceControllerE2.text.trim());
    double e3 = double.parse(priceControllerE3.text.trim());
    double e4 = double.parse(priceControllerE4.text.trim());
    double e5 = double.parse(priceControllerE5.text.trim());
    double e6 = double.parse(priceControllerE6.text.trim());
    double e7 = double.parse(priceControllerE7.text.trim());
    double e8 = double.parse(priceControllerE8.text.trim());
    double e9 = double.parse(priceControllerE9.text.trim());
    double e10 = double.parse(priceControllerE10.text.trim());

    setState(() {
      double resulte = e1+e2+e3+e4+e5+e6+e7+e8+e9+e10;
      eprice = resulte;
    });
  }

  double gprice = 0;

  void calculateGPrice(){
    gprice = tprice - eprice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  controller: desController1,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceController1,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: desController2,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceController2,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: desController3,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceController3,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: desController4,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceController4,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: desController5,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceController5,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

//                TextFormField(
//                  autofocus: true,
//                  controller: desController6,
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
//                  controller: priceController6,
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
//                  controller: desController7,
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
//                  controller: priceController7,
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
//                  controller: desController8,
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
//                  controller: priceController8,
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
//                  controller: desController9,
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
//                  controller: priceController9,
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
//                  controller: desController10,
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
//                  controller: priceController10,
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
                  child: Text("Calculate Income Entry",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Text("${double.parse(tprice.toStringAsFixed(2))}"),

              ],
            ),

            SizedBox(height: 5),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(height: 20),

                Text("Expenses Entry"),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: desControllerE1,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceControllerE1,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: desControllerE2,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceControllerE2,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: desControllerE3,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceControllerE3,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: desControllerE4,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceControllerE4,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: desControllerE5,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceControllerE5,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: desControllerE6,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceControllerE6,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: desControllerE7,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceControllerE7,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: desControllerE8,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceControllerE8,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: desControllerE9,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceControllerE9,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: desControllerE10,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  autofocus: true,
                  controller: priceControllerE10,
                  decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20)
                  ),
                ),

                SizedBox(height: 20),

                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: (){
                    calculateEEntry();
                  },
                  child: Text("Calculate Income Entry",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Text("${double.parse(eprice.toStringAsFixed(2))}"),

              ],
            ),

            SizedBox(height: 5),

            Text("${double.parse(gprice.toStringAsFixed(2))}")
          ],
        ),
      ),
    );
  }
}
