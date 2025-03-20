import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:keeper/core/db/database.dart';
import 'package:phone_form_field/phone_form_field.dart';

class Person extends Equatable {
  final int? id;
  final String name;
  final PhoneNumber phoneNumber;
  final String? isoCode;
  final String? countryCode;
  final String nsn;
  final String? email;
  final String? password;
  final Uint8List? profileImage;
  final double amount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? about;
  final bool agreeToTerms;

  const Person({
    required this.name,
    this.phoneNumber = const PhoneNumber(isoCode: IsoCode.IN, nsn: ''),
    this.id,
    this.isoCode,
    this.countryCode,
    this.nsn = '',
    this.email,
    this.about,
    this.password,
    this.profileImage,
    this.agreeToTerms = false,
    this.createdAt,
    this.updatedAt,
    this.amount = 0.0,
  });

  Person copyWith({
    int? id,
    String? name,
    PhoneNumber? phoneNumber,
    String? email,
    Uint8List? profileImage,
    String? about,
    double? amount,
    String? password,
    bool? agreeToTerms,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? removeImage,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      amount: amount ?? this.amount,
      agreeToTerms: agreeToTerms ?? this.agreeToTerms,
      profileImage:
          removeImage == true ? null : profileImage ?? this.profileImage,
      about: about ?? this.about,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  PersonTblCompanion get toCompanian {
    return PersonTblCompanion.insert(
      name: name,
      nsn: nsn,
      isoCode: Value(phoneNumber.isoCode.name),
      countryCode: Value(phoneNumber.countryCode), 
      amount: Value(amount),
      password: Value(password),
      email: Value(email),
      profileImage: Value(profileImage),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      agreeToTerms: Value(agreeToTerms),
      id: Value(id),
    );
  }

  @override
  List<Object?> get props => [
    name,
    phoneNumber,
    id,
    email,
    about,
    password,
    profileImage,
    agreeToTerms,
    createdAt,
    updatedAt,
    amount,
  ];
}


/* import 'dart:typed_data';

enum PaymentStatus { pending, partiallyPaid, paid }

class Person {
  final int? id;
  final String name;
  final String? phoneNumber;
  final String? email;
  final Uint8List? profileImage;
  final String currency;
  final DateTime? dueDate;
  final List<Transaction> paymentHistory;
  final String? notes;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isUserLogged;

  Person({
    required this.name,
    this.id,
    this.phoneNumber,
    this.email,
    this.profileImage,
    this.currency = "USD",
    this.dueDate,
    List<Transaction>? paymentHistory,
    this.notes,
    DateTime? createdAt,
    this.updatedAt,
    this.isUserLogged = false,
  })  : createdAt = createdAt ?? DateTime.now(),
        paymentHistory = paymentHistory ?? [];

  /// Calculate the remaining owed amount dynamically
  double get owedAmount => paymentHistory.fold(0, (sum, t) => sum + t.amount);

  /// Add a new borrow or repay transaction
  Person addTransaction(Transaction transaction) {
    return copyWith(paymentHistory: [...paymentHistory, transaction]);
  }

  /// Add a repayment transaction (amount should be negative)
  Person addRepayment(double amount, String method, {String? note}) {
    if (amount > owedAmount) {
      throw Exception("Repayment amount exceeds owed balance!");
    }
    Transaction repayment = Transaction(
      amount: -amount, // Repayment is negative
      date: DateTime.now(),
      method: method,
      note: note,
    );
    return addTransaction(repayment);
  }

  Person copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    String? email,
    Uint8List? profileImage,
    String? currency,
    DateTime? dueDate,
    List<Transaction>? paymentHistory,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isUserLogged,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      currency: currency ?? this.currency,
      dueDate: dueDate ?? this.dueDate,
      paymentHistory: paymentHistory ?? List.from(this.paymentHistory),
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isUserLogged: isUserLogged ?? this.isUserLogged,
    );
  }
}

class Transaction {
  final int? id;
  final double amount; // Positive for borrowed, negative for repaid
  final DateTime date;
  final String method; // "Cash", "Card", "Bank Transfer"
  final String? note;

  Transaction({
    this.id,
    required this.amount,
    required this.date,
    required this.method,
    this.note,
  });
}
 */