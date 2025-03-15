import 'package:drift/drift.dart';
import 'package:keeper/core/db/database.dart';
import 'package:phone_form_field/phone_form_field.dart';

class Person {
  final int? id;
  final String name;
  final PhoneNumber? contactNumber;
  final String? email;
  final String? password;
  final Uint8List? imageUrl;
  final double owedAmount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isUserLoged;

  Person({
    required this.name,
    this.contactNumber,
    this.id,
    this.email,
    this.password,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.isUserLoged = false,
    this.owedAmount = 0.0,
  });

  Person copyWith({
    String? name,
    int? id,
    PhoneNumber? contactNumber,
    String? email,
    String? password,
    Uint8List? imageUrl,
    double? owedAmount,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isUserLoged,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      owedAmount: owedAmount ?? this.owedAmount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      password: password ?? this.password,
      isUserLoged: isUserLoged ?? this.isUserLoged,
    );
  }

  PersonTblCompanion get toCompanian {
    return PersonTblCompanion.insert(
      name: name,
      contactNumber: Value(contactNumber),
      owedAmount: owedAmount,
      password: Value(password),
      email: Value(email),
      imageUrl: Value(imageUrl),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      isUserLoged: Value(isUserLoged),
    );
  }
}
