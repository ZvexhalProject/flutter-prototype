class User {
  int id;
  String username;
  String userpasswort;
  int thema;
  String kreiert;
  String letzterlogin;
  String sprache;
  int barrieremodus;

  User(String username, String userpasswort) {
    this.username = username;
    this.userpasswort = userpasswort;
    this.thema = 1;
    this.kreiert = new DateTime.now().toIso8601String();
    this.letzterlogin = new DateTime.now().toIso8601String();
    this.sprache = 'en';
    this.barrieremodus = 1;
  }
}
// class User {
//   Data data;

//   User({this.data});

//   User.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   List<Users> users;

//   Data({this.users});

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['users'] != null) {
//       users = new List<Users>();
//       json['users'].forEach((v) {
//         users.add(new Users.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.users != null) {
//       data['users'] = this.users.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Users {
//   String id;
//   String username;
//   String userpasswort;
//   int thema;
//   String kreiert;
//   String letzterlogin;
//   String sprache;
//   int barrieremodus;

//   Users(
//       {this.id,
//       this.username,
//       this.userpasswort,
//       this.thema,
//       this.kreiert,
//       this.letzterlogin,
//       this.sprache,
//       this.barrieremodus});

//   Users.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     username = json['username'];
//     userpasswort = json['userpasswort'];
//     thema = json['thema'];
//     kreiert = json['kreiert'];
//     letzterlogin = json['letzterlogin'];
//     sprache = json['sprache'];
//     barrieremodus = json['barrieremodus'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['username'] = this.username;
//     data['userpasswort'] = this.userpasswort;
//     data['thema'] = this.thema;
//     data['kreiert'] = this.kreiert;
//     data['letzterlogin'] = this.letzterlogin;
//     data['sprache'] = this.sprache;
//     data['barrieremodus'] = this.barrieremodus;
//     return data;
//   }
// }
