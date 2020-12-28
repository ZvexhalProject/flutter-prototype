import 'package:app/pages/dashboardpage.dart';
import 'package:app/shared/models/user.dart';
import 'package:app/shared/services/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController(text: "WhitneyWisozk");
  final _passwordController = TextEditingController(text: "pBn17UYNSxo_KqB");

  Widget _buildEmailForm() {
    return TextFormField(
        controller: _usernameController,
        //initialValue: "WhitneyWisozk",
        decoration: InputDecoration(
            hintText: "Username",
            hintStyle: TextStyle(fontSize: 20),
            prefixIcon: Icon(Icons.person_outline)));
  }

  Widget _buildPasswordForm() {
    return TextFormField(
      controller: _passwordController,
      // initialValue: "pBn17UYNSxo_KqB",
      decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(fontSize: 20),
          prefixIcon: Icon(Icons.lock)),
      obscureText: true,
    );
  }

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
        color: Colors.white,
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Sinvher",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    )),
              ),
              Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Card(
                                elevation: 0,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(25),
                                  child: Column(children: <Widget>[
                                    _buildEmailForm(),
                                    _buildPasswordForm()
                                  ]),
                                )),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ButtonBar(
                                  children: <Widget>[
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text(
                                          'LOGIN',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                      ),
                                      color: Color(0xff3880ff),
                                      onPressed: () {
                                        reqAuth(_usernameController.text,
                                                _passwordController.text)
                                            .then((value) {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DashboardPage()),
                                            (Route<dynamic> route) => false,
                                          );
                                          ;
                                        }).catchError((e) {
                                          Alert(
                                                  context: context,
                                                  title: "Wrong Credentials",
                                                  desc:
                                                      "Please enter a valid username and password")
                                              .show();
                                        });
                                      },
                                    ),
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text(
                                          'Register',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                      ),
                                      color: Color(0xff3dc2ff),
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              ]),
                        ])),
              ),
            ]),
      ),
    );
  }
}
