import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'expense.g.dart';
part 'expense.freezed.dart';

@freezed
@HiveType(typeId: 3)
class Expense with _$Expense {
  const factory Expense({
    @HiveField(0) required String uuid,
    @HiveField(1) required String name,
    @HiveField(2) required num? amount,
  }) = _Expense;
}
