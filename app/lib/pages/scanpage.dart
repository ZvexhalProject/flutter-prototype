import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String _data = "";

  _scan() async {
    return await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.DEFAULT)
        .then((value) => setState(() => _data = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(3.0),
            child: AppBar(
              //leading: new Container(),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
            )),
        body: Column(children: <Widget>[
          Card(
            elevation: 10,
            margin: EdgeInsets.zero,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.zero,
                        child: Text("Scan Barcode",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500)),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, size: 25),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ])),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.623,
            width: MediaQuery.of(context).size.width,
            child: (Text(_data)),
            // color: Colors.red,
          ),
          Expanded(
              child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            child: Column(children: <Widget>[
              Container(
                  padding: EdgeInsets.only(right: 2, left: 2),
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'SCAN PRODUCT',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                    color: Color(0xff3880ff),
                    onPressed: () => _scan(),
                  ))
            ]),
          ))
        ]));
  }
}
