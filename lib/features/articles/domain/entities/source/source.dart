import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'source.freezed.dart';
part 'source.g.dart';

@freezed
@HiveType(typeId: 3)
class Source with _$Source {
  const factory Source({
    @HiveField(0) String? id,
    @HiveField(1) @Default('Unknown Source') String? name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
