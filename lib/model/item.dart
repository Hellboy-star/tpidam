class Item {
  final String firstname;
  final String lastname;
  final DateTime birthday;
  final String adress;
  final int phone;
  final String mail;
  final String gender;
  final String image;
  final String citation;

  Item({
    required this.firstname,
    required this.lastname,
    required this.birthday,
    required this.adress,
    required this.phone,
    required this.mail,
    required this.gender,
    required this.image,
    required this.citation
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      firstname : json['firstname'],
      lastname : json['lastname'],
      birthday : json['birthday'],
      adress : json['adress'],
      phone : json['phone'],
      mail : json['mail'],
      gender : json['gender'],
      image : json['image'],
      citation : json['citation'],
    );
  }

}



