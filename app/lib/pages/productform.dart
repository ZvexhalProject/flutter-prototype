import 'package:app/shared/models/product.dart';
import 'package:app/shared/services/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _productnameController = TextEditingController();
  final _weightController = TextEditingController();
  final _unitController = TextEditingController();
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _remarkController = TextEditingController();

  Widget _buildProductnameForm() {
    return TextFormField(
        controller: _productnameController,
        //initialValue: "WhitneyWisozk",
        decoration: InputDecoration(
            contentPadding: new EdgeInsets.symmetric(vertical: 18.0),
            hintText: "Productname",
            hintStyle: TextStyle(fontSize: 18),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10, right: 30),
              child: Icon(Icons.info),
            )));
  }

  Widget _buildWeightForm() {
    return TextFormField(
      controller: _weightController,
      keyboardType: TextInputType.number,
      // initialValue: "pBn17UYNSxo_KqB",
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(vertical: 18.0),
          hintText: "Weight",
          hintStyle: TextStyle(fontSize: 18),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 30),
            child: Icon(Icons.info),
          )),
    );
  }

  Widget _buildUnitForm() {
    return TextFormField(
      controller: _unitController,
      // initialValue: "pBn17UYNSxo_KqB",
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(vertical: 18.0),
          hintText: "Unit",
          hintStyle: TextStyle(fontSize: 18),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 30),
            child: Icon(Icons.info),
          )),
    );
  }

  Widget _buildAmountForm() {
    return TextFormField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      // initialValue: "pBn17UYNSxo_KqB",
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(vertical: 18.0),
          hintText: "Amount",
          hintStyle: TextStyle(fontSize: 18),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 30),
            child: Icon(Icons.info),
          )),
    );
  }

  Widget _buildcategoryForm() {
    return TextFormField(
      controller: _categoryController,
      // initialValue: "pBn17UYNSxo_KqB",
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(vertical: 18.0),
          hintText: "Category",
          hintStyle: TextStyle(fontSize: 18),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 30),
            child: Icon(Icons.info),
          )),
    );
  }

  Widget _buildRemarkForm() {
    return TextFormField(
      controller: _remarkController,
      // initialValue: "pBn17UYNSxo_KqB",
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(vertical: 18.0),
          hintText: "Remark",
          hintStyle: TextStyle(fontSize: 18),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 30),
            child: Icon(Icons.info),
          )),
    );
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
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
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
                        child: Text("Create Product",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500)),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, size: 25),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ])
                //color: Colors.red,
                ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: Card(
                margin: EdgeInsets.only(top: 2),
                elevation: 0,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(children: <Widget>[
                    _buildProductnameForm(),
                    _buildWeightForm(),
                    _buildUnitForm(),
                    _buildAmountForm(),
                    _buildcategoryForm(),
                    _buildRemarkForm(),
                    SizedBox(height: 240),
                  ]),
                )),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
            Container(
              //height: MediaQuery.of(context).size.height * 0.08,
              padding: EdgeInsets.only(right: 5, left: 5, bottom: 20),
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'CREATE',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                color: Color(0xff3880ff),
                onPressed: () {
                  Product pep;
                  try {
                    pep = new Product(
                        _productnameController.text,
                        int.parse(_weightController.text),
                        _unitController.text,
                        int.parse(_amountController.text),
                        _categoryController.text,
                        _remarkController.text);
                  } catch (e) {
                    Alert(
                            context: context,
                            title: "Error",
                            desc: "Please enter valid Product Information")
                        .show();
                    setState(() {});
                  }
                  createProduct(pep)
                      .then((value) => setState(() {
                            _amountController.clear();
                            _categoryController.clear();
                            _productnameController.clear();
                            _unitController.clear();
                            _weightController.clear();
                            _remarkController.clear();
                            Alert(
                                    context: context,
                                    title: "Success",
                                    desc: "Product added to database")
                                .show();
                          }))
                      .catchError((e) {});
                },
              ),
            ),
          ])
        ]),
      ),
    );
  }
}
