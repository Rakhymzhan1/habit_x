import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_x/entities/transaction_entity.dart';

class FinanceCubit extends Cubit<FinanceState> {
  FinanceCubit() : super(FinanceState());
  void addTransaction(String comment, String category, double amount) {
    final transaction = TransactionEntity(
      id: DateTime.now().toString(),
      category: category,
      amount: amount,
      comment: comment,
    );
    final updatedTransactions = List<TransactionEntity>.from(state.transactions)
      ..add(transaction);
    emit(FinanceState(transactions: updatedTransactions));
  }
}

class FinanceState {
  FinanceState({this.transactions = const [], this.errorMessage});
  final List<String> categories = [
    'Food',
    'Transport',
    'Entertainment',
    'Health',
    'Education',
    'Other',
  ];
  final List<TransactionEntity> transactions;
  final String? errorMessage;
}
