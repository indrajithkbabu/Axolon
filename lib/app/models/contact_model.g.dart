// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactModelAdapter extends TypeAdapter<ContactModel> {
  @override
  final int typeId = 0;

  @override
  ContactModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactModel(
      id: fields[0] as String,
      name: fields[1] as String,
      phoneNumber: fields[2] as String,
      email: fields[3] as String,
      group: fields[4] as String,
      profilePhoto: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ContactModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.group)
      ..writeByte(5)
      ..write(obj.profilePhoto);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
