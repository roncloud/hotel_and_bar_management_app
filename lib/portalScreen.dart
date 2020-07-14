import 'package:flutter/material.dart';
import 'package:hotelmanage/reportEntry.dart';
import 'package:hotelmanage/viewReport.dart';

class portalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
//          decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage("assets/images/bg.jpg"),
//                fit: BoxFit.cover,
//              )
//          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Material(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Enter Report",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2
                      ),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(50),

                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return reportEntry();
                  }));
                },
              ),

              SizedBox(height: 30),

              GestureDetector(
                child: Material(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("View Report",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2
                      ),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(50),

                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return viewReport();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
