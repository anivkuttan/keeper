import 'dart:typed_data';

class Person {
  final String name;
  final String contactNumber;
  final String? email;
  final Uint8List? imageUrl;
  final double owedAmount;

  Person({
    required this.name,
    required this.contactNumber,
    this.email,
    this.imageUrl,
    required this.owedAmount,
  });

  Person copyWith({
    String? name,
    String? contactNumber,
    String? email,
    Uint8List? imageUrl,
    double? owedAmount,
  }) {
    return Person(
      name: name ?? this.name,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      owedAmount: owedAmount ?? this.owedAmount,
    );
  }
}
