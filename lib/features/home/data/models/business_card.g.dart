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
      userId: fields[1] as String,
      name: fields[2] as String,
      title: fields[3] as String,
      location: fields[4] as String,
      email: fields[5] as String,
      website: fields[6] as String,
      avatarUrl: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BusinessCard obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.website)
      ..writeByte(7)
      ..write(obj.avatarUrl);
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
