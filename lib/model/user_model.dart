class UserModel {
  String adSoyad;
  String mail;
  String phone;
  UserModel({
    required this.adSoyad,
    required this.mail,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'adSoyad': adSoyad,
      'mail': mail,
      'phone': phone,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      adSoyad: map['adSoyad'] as String,
      mail: map['mail'] as String,
      phone: map['phone'] as String,
    );
  }
}
