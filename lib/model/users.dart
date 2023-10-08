import 'package:restapidemo/model/user_dob.dart';
import 'package:restapidemo/model/user_location.dart';
import 'package:restapidemo/model/user_name.dart';
import 'package:restapidemo/model/user_picture.dart';

class Users {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final Username name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;
  Users({
      required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.name,
      required this.nat,
      required this.dob,
      required this.location,
      required this.picture,
  });

  factory Users.fromMap(Map<String, dynamic> e){
    final name = Username.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);
    final picture = UserPicture.fromMap(e['picture']);
    final location = UserLocation.fromMap(e['location']);
    return Users(
      gender: e['gender'],
      email: e['email'],
      phone: e['phone'],
      cell: e['cell'],
      nat: e['nat'],
      name: name,
      dob: dob,
      location: location,
      picture : picture
    );
  }

  String get fullname {
    return'${name.title} ${name.first} ${name.last}';
  }
}