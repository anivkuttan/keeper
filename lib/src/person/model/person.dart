import 'package:drift/drift.dart';
import 'package:keeper/core/db/database.dart';

class Person {
  final int? id;
  final String name;
  final String contactNumber;
  final String? email;
  final Uint8List? imageUrl;
  final double owedAmount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Person({
    required this.name,
    required this.contactNumber,
    this.id,
    this.email,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    required this.owedAmount,
  });

  Person copyWith({
    String? name,
    int? id,
    String? contactNumber,
    String? email,
    Uint8List? imageUrl,
    double? owedAmount,
    DateTime? createdAt,
    DateTime? updatedAt,
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
    );
  }

  PersonTblCompanion get toCompanian {
    return PersonTblCompanion.insert(
      name: name,
      contactNumber: contactNumber,
      owedAmount: owedAmount,
      email: Value(email),
      imageUrl: Value(imageUrl),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
    );
  }
}
