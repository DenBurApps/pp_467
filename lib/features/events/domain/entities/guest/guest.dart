import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'guest.g.dart';
part 'guest.freezed.dart';

@freezed
@HiveType(typeId: 2)
class Guest with _$Guest {
  const factory Guest({
    @HiveField(0) required String uuid,
    @HiveField(1) required String name,
    @HiveField(2) required String contacts,
  }) = _Guest;
}
