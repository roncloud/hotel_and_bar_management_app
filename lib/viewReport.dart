import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotelmanage/LogIn.dart';

// Get user detail from firebase
FirebaseUser _user;

class viewReport extends StatefulWidget {
  @override
  _viewReportState createState() => _viewReportState();
}

class _viewReportState extends State<viewReport> {
  // Connecting to firestore
  Firestore firestore = Firestore.instance;

  // Connecting to firebase authentication
  FirebaseAuth _auth = FirebaseAuth.instance;

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
        child: Column(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('reports').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else {
                    final rpt = snapshot.data.documents;
                    List<ReportGroup> listItems = [];
                    for(var report in rpt){
                      final inc = report.data["income"];
                      final exp = report.data["expenses"];
                      final bal = report.data["balance"];
                      final pst = report.data["postby"];

                      //final statusUser = _user.email;
                      final reportsDetails = ReportGroup(
                        income: inc,
                        expense: exp,
                        balance: bal,
                        postby: pst,
                      );
                      listItems.add(reportsDetails);
                    }

                    return Expanded(
                      child: ListView(
                        children: listItems,
                      ),
                    );
                  }
                },
            ),
          ],
        ),
      ),
    );
  }
}

class ReportGroup extends StatelessWidget{
  final double income;
  final double expense;
  final double balance;
  final String postby;
  final bool user;

  const ReportGroup({Key key, this.income, this.expense, this.balance, this.postby, this.user}) :
      super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.only(top: 10, bottom: 10, left:25, right: 25),
    child: user ? Material(
      color: Colors.greenAccent,
      elevation: 5,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text("income: $income",
              style: TextStyle(
                color: Colors.blue
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text("expenses: $expense",
              style: TextStyle(
                  color: Colors.blue
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text("balance: $balance",
              style: TextStyle(
                  color: Colors.blue
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text("postby: $postby",
              style: TextStyle(
                  color: Colors.blue
              ),
            ),
          ),
        ],
      ),
    )
      :
    Material(
      color: Colors.greenAccent,
      elevation: 5,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text("income: $income",
              style: TextStyle(
                  color: Colors.blue
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text("expenses: $expense",
              style: TextStyle(
                  color: Colors.blue
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text("balance: $balance",
              style: TextStyle(
                  color: Colors.blue
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text("postby: $postby",
              style: TextStyle(
                  color: Colors.blue
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}