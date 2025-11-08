import 'dart:developer';

class UserModel {
  int? id = 0;
  String? name = '';
  String? email = '';
  String? photo = '';
  String? city = '';
  String? neighborhood = '';
  int? age = 0;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.photo,
      this.city,
      this.neighborhood,
      this.age});

  factory UserModel.fromMap(Map<String, dynamic> map, String key) {
    if (map[key] != null) {
      return UserModel(
        id: map['id'] as int,
        name: map[key]['name'] as String,
        email: map[key]['email'] as String,
        photo: map[key]['photo'] as String,
        city: map[key]['city'] as String,
        neighborhood: map[key]['neighborhood'] as String,
        age: map[key]['age'] as int,
      );
    } else {
      return UserModel(
        id: map['id'] as int,
        name: map['name'] as String,
        email: map['email'] as String,
        photo: map['photo'] as String,
        city:  map['city'] as String, 
 neighborhood: map['neighborhood'] as String,
        age:   map['age'] as int,
      );
    }
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? photo,
    String? city,
    String? neighborhood,
    int? age,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      city: city ?? this.city,
      neighborhood: neighborhood ?? this.neighborhood,
      age: age ?? this.age,
    );
  }
}
