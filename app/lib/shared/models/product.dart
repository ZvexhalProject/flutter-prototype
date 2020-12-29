class Product {
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

  Product(String produktname, int gewicht, String einheit, int menge,
      String kategorie, String bemerkung) {
    this.produktname = produktname;
    this.gewicht = gewicht;
    this.einheit = einheit;
    this.menge = menge;
    this.produkticon = 1;
    this.kategorie = kategorie;
    this.mindesthaltbarkeit = "2020-12-25";
    this.bemerkung = bemerkung;
  }
}
