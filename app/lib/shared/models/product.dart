class Product {
  Data data;

  Product({this.data});

  Product.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Produkte> produkte;

  Data({this.produkte});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['produkte'] != null) {
      produkte = new List<Produkte>();
      json['produkte'].forEach((v) {
        produkte.add(new Produkte.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.produkte != null) {
      data['produkte'] = this.produkte.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Produkte {
  String id;
  String produktcode;
  String produktname;
  int gewicht;
  String einheit;
  int menge;
  int produkticon;
  String kategorie;
  String mindesthaltbarkeit;
  String bemerkung;

  Produkte(
      {this.id,
      this.produktcode,
      this.produktname,
      this.gewicht,
      this.einheit,
      this.menge,
      this.produkticon,
      this.kategorie,
      this.mindesthaltbarkeit,
      this.bemerkung});

  Produkte.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    produktcode = json['produktcode'];
    produktname = json['produktname'];
    gewicht = json['gewicht'];
    einheit = json['einheit'];
    menge = json['menge'];
    produkticon = json['produkticon'];
    kategorie = json['kategorie'];
    mindesthaltbarkeit = json['mindesthaltbarkeit'];
    bemerkung = json['bemerkung'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['produktcode'] = this.produktcode;
    data['produktname'] = this.produktname;
    data['gewicht'] = this.gewicht;
    data['einheit'] = this.einheit;
    data['menge'] = this.menge;
    data['produkticon'] = this.produkticon;
    data['kategorie'] = this.kategorie;
    data['mindesthaltbarkeit'] = this.mindesthaltbarkeit;
    data['bemerkung'] = this.bemerkung;
    return data;
  }
}
