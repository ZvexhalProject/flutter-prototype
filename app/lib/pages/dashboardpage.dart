import 'package:app/pages/productform.dart';
import 'package:app/pages/productlist.dart';
import 'package:app/pages/scanpage.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: AppBar(
              backgroundColor: Colors.black,
            )),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //color: Colors.white,
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,
                      child: Column(children: <Widget>[
                        Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Sinvher Testapplication FLUTTER",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.normal),
                            )),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Hello Testuser!",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            )),
                      ])),
                  Expanded(
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        child: Column(children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            width: MediaQuery.of(context).size.width,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'CREATE PRODUCT',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                              color: Color(0xff3880ff),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FormPage()),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            width: MediaQuery.of(context).size.width,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'PPRODUCT LIST',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                              color: Color(0xff3dc2ff),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListPage()),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            width: MediaQuery.of(context).size.width,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'SCAN PRODUCT',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                              color: Color(0xff5260ff),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScanPage()),
                                );
                              },
                            ),
                          )
                        ])),
                  )
                ])));
  }
}
