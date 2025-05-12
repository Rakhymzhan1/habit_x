import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable{
  final String id;
  final String comment;
  final double amount;
  final String category;

  const TransactionEntity({
    required this.id,
    required this.comment,
    required this.amount,
    required this.category,
  });

  @override
  List<Object?> get props => [id, comment, amount, category];
}