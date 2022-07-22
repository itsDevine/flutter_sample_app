// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iconStateModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IconStateModelAdapter extends TypeAdapter<IconStateModel> {
  @override
  final int typeId = 0;

  @override
  IconStateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IconStateModel(
      icon: fields[0] as int,
      color: fields[1] as int,
      size: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, IconStateModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.icon)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.size);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IconStateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
