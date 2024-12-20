import 'package:hive/hive.dart';
import 'dataModel.dart';

class DataModelAdapter extends TypeAdapter<DataModel> {
  @override
  final int typeId = 1;

  @override
  DataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return DataModel(
      username: fields[0] as String,
      encryptedPassword: fields[1] as String,
      password: '', // The password is not stored in Hive
    );
  }

  @override
  void write(BinaryWriter writer, DataModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.encryptedPassword);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DataModelAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}