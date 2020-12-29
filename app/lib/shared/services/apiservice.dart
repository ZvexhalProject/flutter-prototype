import 'dart:convert';
import 'package:app/shared/models/product.dart';
import 'package:app/shared/models/user.dart';
import 'package:http/http.dart' as http;

var url = "http://10.0.2.2:4000/graphql";
//var url = "https://world.openfoodfacts.org/api/v0/product/42143819";
//var url = "http://calapi.inadiutorium.cz/api/v0/en/calendars/default/today";

void reqAuth2() async {
//payload = {query: `query {users(username: "${user.getUsername()}", userpasswort: "${user.getPassword()}"){username,userpasswort}}`};

  //var response = await http.post(url, body );
  var response = await http.get(
    url,
  );
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    //var itemCount = jsonResponse['totalItems'];
    print('Number of books about http: $jsonResponse.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

Future reqAuth(String usernameField, String userpasswortField) async {
  var payload = {
    "query": "query {users(username: \"" +
        usernameField +
        "\", userpasswort: \"" +
        userpasswortField +
        "\"){username,userpasswort}}"
  };

  var jsstring = jsonEncode(payload);

  try {
    var response2 = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsstring);
    var parsedJson = jsonDecode(response2.body);
    var username = parsedJson["data"]["users"].asMap()[0]["username"];
    var userpasswort = parsedJson["data"]["users"].asMap()[0]["userpasswort"];
    return new User(username, userpasswort);
  } catch (e) {
    // print(e);
    return Future.error(e);
  }
}

Future createProduct(Product product) async {
  var payload = {
    "query": "mutation {addProdukt(produktname: \"" +
        product.produktname +
        "\", gewicht:" +
        product.gewicht.toString() +
        ", einheit: \"" +
        product.einheit +
        "\",menge:" +
        product.menge.toString() +
        ", produkticon:" +
        product.produkticon.toString() +
        ", kategorie:\"" +
        product.kategorie +
        "\", mindesthaltbarkeit: \"" +
        product.mindesthaltbarkeit +
        "\", bemerkung: \"" +
        product.bemerkung +
        "\"){id}}"
  };

  var jsstring = jsonEncode(payload);
  try {
    var response2 = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsstring);
    var parsedJson = jsonDecode(response2.body);
    print(parsedJson);

    // var username = parsedJson["data"]["users"].asMap()[0]["username"];
    // var userpasswort = parsedJson["data"]["users"].asMap()[0]["userpasswort"];
    return;
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}

Future<List<Product>> fetchProduct() async {
  var payload = {
    "query":
        "query {produkte{id,produktcode,produktname,gewicht,einheit,menge,produkticon,kategorie,mindesthaltbarkeit,bemerkung}}"
  };
  List<Product> myProductList = List<Product>();
  var jsstring = jsonEncode(payload);
  try {
    var response2 = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsstring);
    var parsedJson = jsonDecode(response2.body);
    // print(parsedJson);

    var list = parsedJson["data"]["produkte"].asMap();
    for (var i = 0; i < parsedJson["data"]["produkte"].asMap().length; i++) {
      Product nop = new Product(
          list[i]["produktname"],
          list[i]["gewicht"],
          list[i]["einheit"],
          list[i]["menge"],
          list[i]["kategorie"],
          list[i]["bemerkung"]);
      myProductList.add(nop);
    }
    //for (Product product in myProductList) print(product.produktname);

    // var username = parsedJson["data"]["users"].asMap()[0]["username"];
    // var userpasswort = parsedJson["data"]["users"].asMap()[0]["userpasswort"];
    return myProductList;
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}

// print(parsedJson["data"]["users"].asMap()[0]["username"]);
