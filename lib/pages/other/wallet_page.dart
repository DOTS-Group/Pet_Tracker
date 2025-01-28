import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/widgets/other/petselected_widget.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  // Örnek veriler
  final List<Map<String, dynamic>> expenses = [
    {
      'category': 'Food',
      'amount': 150.0,
      'date': '2024-03-15',
      'icon': Icons.food_bank,
      'color': Colors.orange,
    },
    {
      'category': 'Vaccine',
      'amount': 200.0,
      'date': '2024-03-10',
      'icon': Icons.medical_services,
      'color': Colors.blue,
    },
    {
      'category': 'Treatment',
      'amount': 300.0,
      'date': '2024-03-05',
      'icon': Icons.healing,
      'color': Colors.red,
    },
  ];

  void _showAddExpenseDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr("addExpense"),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // Add expense form will be here
            TextField(
              decoration: InputDecoration(
                labelText: context.tr("amount"),
                prefixIcon: const Icon(Icons.attach_money),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: context.tr("category"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: [
                'Food',
                'Vaccine',
                'Treatment',
                'Toys',
                'Grooming',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: SharedConstants.orangeColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(context.tr("save")),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(context.tr("expenses")),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: SharedConstants.orangeColor,
        onPressed: _showAddExpenseDialog,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PetSelectedDropdownButtonWidget(),
            const SizedBox(height: 24),
            // Expense Summary Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr("totalExpenses"),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "\$${expenses.fold(0.0, (sum, item) => sum + item['amount'])}",
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: SharedConstants.orangeColor,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 200,
                      child: PieChart(
                        PieChartData(
                          sections: expenses
                              .map(
                                (expense) => PieChartSectionData(
                                  color: expense['color'] as Color,
                                  value: expense['amount'] as double,
                                  title:
                                      '${expense['category']}\n${expense['amount']}',
                                  radius: 80,
                                  titleStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                              .toList(),
                          sectionsSpace: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              context.tr("recentExpenses"),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            // Recent Expenses List
            ...expenses.map((expense) => Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          (expense['color'] as Color).withOpacity(0.2),
                      child: Icon(
                        expense['icon'] as IconData,
                        color: expense['color'] as Color,
                      ),
                    ),
                    title: Text(expense['category'] as String),
                    subtitle: Text(expense['date'] as String),
                    trailing: Text(
                      '\$${expense['amount']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
