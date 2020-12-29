import 'package:app/shared/models/product.dart';
import 'package:app/shared/services/apiservice.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Product> myProductList = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchforInit();
    super.initState();
  }

  Future fetchforInit() async {
    myProductList = await fetchProduct();
    setState(() {
      myProductList = myProductList;
    });
    // print(myProductList.length);
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
          physics: ScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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
                            child: Text("Productlist",
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
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: myProductList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        margin: EdgeInsets.only(top: 2),
                        child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Column(children: <Widget>[
                                Container(
                                    width: 70,
                                    child: Center(
                                        child: Icon(
                                      Icons.inbox,
                                      size: 30,
                                    )))
                              ]),
                              Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.only(top: 8, bottom: 12),
                                      height: 165,
                                      width: 60,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(myProductList[index].produktname,
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w900)),
                                          Text("Weight: " +
                                              myProductList[index]
                                                  .gewicht
                                                  .toString()),
                                          Text("Unit: " +
                                              myProductList[index]
                                                  .einheit
                                                  .toString()),
                                          Text("Amount: " +
                                              myProductList[index]
                                                  .menge
                                                  .toString()),
                                          Text("Category: " +
                                              myProductList[index].kategorie),
                                          Text("Best before: " +
                                              myProductList[index]
                                                  .mindesthaltbarkeit),
                                          Text("Bemerkung: Null")
                                        ],
                                      )))
                            ]));
                  })
            ],
          )),
    );
  }
}
