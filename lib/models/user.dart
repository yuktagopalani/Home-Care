class User {
  String name;
  String email;
  String imageUrl;
  String phone;
  String uid;
  String address;

  User(
      {this.name,
        this.email,
        this.imageUrl,
        this.phone,
        this.uid, this.address}
        );

  User.fromJson(Map<String, dynamic> json) {
    uid = json['UID'];
    name = json['Name'];
    email = json['Email'];
    imageUrl = json['ImageURL'];
    phone = json['Phone'];
    address=json['Address'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> userDetail = new Map<String, dynamic>();
    userDetail['UID'] = this.uid;
    userDetail['Name'] = this.name;
    userDetail['Email'] = this.email;
    userDetail['ImageURL'] = this.imageUrl;
    userDetail['Phone'] = this.phone;
    userDetail['Address'] = this.address;

    return userDetail;
  }
}
