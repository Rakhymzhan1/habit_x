import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_x/blocs/finance/finance_cubit.dart';
import 'package:habit_x/entities/transaction_entity.dart';
import 'package:habit_x/widgets/custom_float_button.dart';
import 'package:habit_x/widgets/custom_text_form_field.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  final cubit = FinanceCubit();
  int currentPage = 0;

  pages(List<TransactionEntity> list) => [
    FinanceShower(
      title: 'Mar 1 - Mar 31',
      items: [
        _Item(
          title: 'Food',
          amount: list
              .where((transaction) => transaction.category == 'Food')
              .fold(0, (sum, transaction) => sum + transaction.amount),
        ),
        _Item(
          title: 'Transport',
          amount: list
              .where((transaction) => transaction.category == 'Transport')
              .fold(0, (sum, transaction) => sum + transaction.amount),
        ),
        _Item(
          title: 'Entertainment',
          amount: list
              .where((transaction) => transaction.category == 'Entertainment')
              .fold(0, (sum, transaction) => sum + transaction.amount),
        ),
        _Item(
          title: 'Health',
          amount: list
              .where((transaction) => transaction.category == 'Health')
              .fold(0, (sum, transaction) => sum + transaction.amount),
        ),
        _Item(
          title: 'Education',
          amount: list
              .where((transaction) => transaction.category == 'Education')
              .fold(0, (sum, transaction) => sum + transaction.amount),
        ),
        _Item(
          title: 'Other',
          amount: list
              .where((transaction) => transaction.category == 'Other')
              .fold(0, (sum, transaction) => sum + transaction.amount),
        ),
      ],
    ),
    FinanceShower(
      title: 'Mar 1 - Mar 31',
      items: [
        _Item(title: 'Wage', amount: 200),
        _Item(title: 'Investment', amount: 150),
        _Item(title: 'Gift', amount: 300),
        _Item(title: 'Other', amount: 250),
      ],
    ),

    FinanceShower(
      title: 'Mar 1 - Mar 31',
      items: [
        _Item(title: 'Account 1', amount: 200),
        _Item(title: 'Account 2', amount: 150),
        _Item(title: 'Account 3', amount: 300),
        _Item(title: 'Account 4', amount: 100),
        _Item(title: 'Total', amount: 1000),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: cubit,
        child: BlocBuilder<FinanceCubit, FinanceState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentPage = 0;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: const Offset(
                                      0,
                                      3,
                                    ), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'Expenses',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentPage = 1;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: const Offset(
                                      0,
                                      3,
                                    ), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'Income',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentPage = 2;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: const Offset(
                                      0,
                                      3,
                                    ), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'Accounts',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  pages(state.transactions)[currentPage],
                  SizedBox(height: 20),
                  Text(
                    'Transactions',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = state.transactions[index];
                        return ListTile(
                          title: Text(transaction.comment),
                          subtitle: Text(transaction.category),
                          trailing: Text('\$${transaction.amount}'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        icon: Icon(Icons.add),
        onPressed: () {showMyBottomSheet(context);},
      ),
    );
  }
  showMyBottomSheet(BuildContext context) {
    showBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      builder: (context) {
        return FinanceBottomSheet(
          categories: cubit.state.categories,
          onAddTransaction: (comment, category, amount) {
            cubit.addTransaction(comment, category, amount);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}

class FinanceBottomSheet extends StatefulWidget {
  const FinanceBottomSheet({
    super.key,
    required this.categories,
    required this.onAddTransaction,
  });
  final List<String> categories;
  final Function(String, String, double) onAddTransaction;

  @override
  State<FinanceBottomSheet> createState() => _FinanceBottomSheetState();
}

class _FinanceBottomSheetState extends State<FinanceBottomSheet> {
  final commentController = TextEditingController();
  final categoryController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Transaction',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          CustomTextFormField(hintText: 'Comment', controller: commentController,),
          SizedBox(height: 10),
          CustomTextFormField(hintText: 'Category', controller: categoryController,),
          SizedBox(height: 10),
          CustomTextFormField(hintText: 'Amount', controller: amountController,),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Call the function to add the transaction
              widget.onAddTransaction(
                commentController.text,
                categoryController.text,
                double.tryParse(amountController.text) ?? 0.0,
              );
            },
            child: Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}

class _Item {
  final String title;
  final double amount;
  _Item({required this.title, required this.amount});
}

class FinanceShower extends StatelessWidget {
  const FinanceShower({super.key, required this.title, required this.items});
  final String title;
  final List<_Item> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Show limit?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Transform.scale(
                        scale: 0.5,
                        child: Switch(value: false, onChanged: (value) {}),
                      ),
                    ],
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.black, width: 1),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Limits',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListView.separated(
                itemCount: items.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return showRow(title: item.title, amount: item.amount);
                },
                separatorBuilder:
                    (context, index) => const SizedBox(height: 10),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }

  showRow({required String title, required double amount}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'T${amount}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 5),
            Icon(Icons.add_box_outlined, size: 15, color: Colors.black),
          ],
        ),
      ],
    );
  }
}


//  return showRow(
//                               title: state.categories[index],
//                               amount: state.transactions
//                                   .where(
//                                     (transaction) =>
//                                         transaction.category ==
//                                         state.categories[index],
//                                   )
//                                   .fold(
//                                     0,
//                                     (sum, transaction) =>
//                                         sum + transaction.amount,
//                                   ),
//                             );