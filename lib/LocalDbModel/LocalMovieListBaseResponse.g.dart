// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LocalMovieListBaseResponse.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalMovieListBaseResponseAdapter
    extends TypeAdapter<LocalMovieListBaseResponse> {
  @override
  final int typeId = 0;

  @override
  LocalMovieListBaseResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalMovieListBaseResponse(
      genres: (fields[0] as List?)?.cast<String>(),
      movies: (fields[1] as List?)?.cast<Movies>(),
    );
  }

  @override
  void write(BinaryWriter writer, LocalMovieListBaseResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.genres)
      ..writeByte(1)
      ..write(obj.movies);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalMovieListBaseResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
