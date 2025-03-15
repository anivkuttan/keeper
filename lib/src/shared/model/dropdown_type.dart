import 'package:equatable/equatable.dart';

class DropDownType extends Equatable {
  final String displayValue;
  final String id;
  const DropDownType({required this.displayValue, required this.id});

  Map<String, String> toJson() => {'displayValue': displayValue, 'id': id};

  DropDownType fromJson(Map<String, dynamic> json) {
    return DropDownType(
      displayValue: json['displayValue'] as String,
      id: json['id'] as String,
    );
  }

  @override
  List<Object?> get props => [displayValue, id];
}
