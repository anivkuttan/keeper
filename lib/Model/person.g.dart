// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 1;

  @override
  Person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      personName: fields[2] as String,
      personAmount: fields[3] as int,
      personImage: fields[1] as Uint8List?,
      listOfTask: (fields[4] as List).cast<Task>(),
      isSelected: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.personImage)
      ..writeByte(2)
      ..write(obj.personName)
      ..writeByte(3)
      ..write(obj.personAmount)
      ..writeByte(4)
      ..write(obj.listOfTask)
      ..writeByte(5)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
