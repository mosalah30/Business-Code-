// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BusinessCardAdapter extends TypeAdapter<BusinessCard> {
  @override
  final int typeId = 1;

  @override
  BusinessCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BusinessCard(
      id: fields[0] as String,
      name: fields[1] as String,
      company: fields[2] as String,
      phone: fields[3] as String,
      email: fields[4] as String,
      address: fields[5] as String,
      imageUrl: fields[6] as String?,
      createdAt: fields[7] as DateTime,
      updatedAt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BusinessCard obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.company)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.imageUrl)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
