import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../models/weight_data.dart';
import '../../shared/constants_shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/weight_provider.dart';

class PetDetailsPage extends StatefulWidget {
  const PetDetailsPage({super.key});

  @override
  State<PetDetailsPage> createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends State<PetDetailsPage> {
  String selectedPeriod = "6months";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer(
      builder: (context, ref, child) {
        final allWeightData = ref.watch(weightDataProvider);
        final List<WeightData> weightDataList = getFilteredData(allWeightData);
        final List<FlSpot> spots = weightDataList
            .asMap()
            .entries
            .map((entry) => FlSpot(entry.key.toDouble(), entry.value.weight))
            .toList();

        return Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              context.tr("petWeightTracking"),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: width * 0.045, // Responsive font size
                  ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(height * SharedConstants.paddingGenerall),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Current Weight Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                        height * SharedConstants.paddingGenerall),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                context.tr("currentWeight"),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // Add Weight Dialog
                                showDialog(
                                  context: context,
                                  builder: (context) => const AddWeightDialog(),
                                );
                              },
                              icon: const Icon(Icons.add_circle),
                              color: SharedConstants.orangeColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              "${weightDataList.last.weight.toStringAsFixed(1)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    color: SharedConstants.orangeColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        width * 0.08, // Responsive font size
                                  ),
                            ),
                            SizedBox(width: width * 0.02),
                            Text(
                              "kg",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: Colors.grey[600],
                                    fontSize:
                                        width * 0.045, // Responsive font size
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Grafik kartı
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                        height * SharedConstants.paddingGenerall),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context.tr("weightHistory"),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Colors.grey[600],
                                    fontSize: width * 0.04,
                                  ),
                            ),
                            // Zaman aralığı seçici
                            DropdownButton<String>(
                              value: selectedPeriod,
                              items: [
                                DropdownMenuItem(
                                  value: "1month",
                                  child: Text(context.tr("lastMonth")),
                                ),
                                DropdownMenuItem(
                                  value: "3months",
                                  child: Text(context.tr("last3Months")),
                                ),
                                DropdownMenuItem(
                                  value: "6months",
                                  child: Text(context.tr("last6Months")),
                                ),
                                DropdownMenuItem(
                                  value: "1year",
                                  child: Text(context.tr("lastYear")),
                                ),
                              ],
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    selectedPeriod = value;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        // İstatistik özeti
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
                            _buildStatItem(
                              context,
                              context.tr("startWeight"),
                              "${weightDataList.first.weight} kg",
                              Icons.scale,
                            ),
                            _buildStatItem(
                              context,
                              context.tr("currentWeight"),
                              "${weightDataList.last.weight} kg",
                              Icons.monitor_weight_outlined,
                            ),
                            _buildStatItem(
                              context,
                              context.tr("change"),
                              "${(weightDataList.last.weight - weightDataList.first.weight).toStringAsFixed(1)} kg",
                              Icons.trending_up,
                              color: weightDataList.last.weight >
                                      weightDataList.first.weight
                                  ? SharedConstants.greenColor
                                  : SharedConstants.redColor,
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.03),
                        SizedBox(
                          height: height * 0.3,
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(
                                show: true,
                                drawVerticalLine: false,
                                horizontalInterval: 1,
                                getDrawingHorizontalLine: (value) {
                                  return FlLine(
                                    color: Colors.grey[300],
                                    strokeWidth: 1,
                                  );
                                },
                              ),
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 1,
                                    getTitlesWidget: (value, meta) {
                                      if (value.toInt() >=
                                          weightDataList.length) {
                                        return const SizedBox.shrink();
                                      }
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          selectedPeriod == "1year"
                                              ? DateFormat('MM/yy').format(
                                                  weightDataList[value.toInt()]
                                                      .date)
                                              : DateFormat('dd/MM').format(
                                                  weightDataList[value.toInt()]
                                                      .date),
                                          style: TextStyle(
                                            fontSize: width * 0.025,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 2,
                                    reservedSize: width * 0.08,
                                    getTitlesWidget: (value, meta) {
                                      return Text(
                                        value.toInt().toString(),
                                        style: TextStyle(
                                          fontSize: width *
                                              0.03, // Responsive font size
                                          color: Colors.grey[600],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              borderData: FlBorderData(show: false),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: spots,
                                  isCurved: true,
                                  color: SharedConstants.orangeColor,
                                  barWidth: 3,
                                  dotData: FlDotData(
                                    show: true,
                                    getDotPainter:
                                        (spot, percent, barData, index) {
                                      return FlDotCirclePainter(
                                        radius: 6,
                                        color: Colors.white,
                                        strokeWidth: 3,
                                        strokeColor:
                                            SharedConstants.orangeColor,
                                      );
                                    },
                                  ),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    color: SharedConstants.orangeColor
                                        .withOpacity(0.1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<WeightData> getFilteredData(List<WeightData> data) {
    data.sort((a, b) => a.date.compareTo(b.date)); // Tarihe göre sırala

    switch (selectedPeriod) {
      case "1month":
        // Son ay için haftalık veriler (4 nokta)
        final lastMonth = data
            .where((item) => item.date
                .isAfter(DateTime.now().subtract(const Duration(days: 30))))
            .toList();

        return _groupDataByPeriod(lastMonth, 7); // 7 günlük gruplar

      case "3months":
        // 3 ay için 2 haftalık veriler (6 nokta)
        final last3Months = data
            .where((item) => item.date
                .isAfter(DateTime.now().subtract(const Duration(days: 90))))
            .toList();

        return _groupDataByPeriod(last3Months, 15); // 15 günlük gruplar

      case "6months":
        // 6 ay için aylık veriler (6 nokta)
        final last6Months = data
            .where((item) => item.date
                .isAfter(DateTime.now().subtract(const Duration(days: 180))))
            .toList();

        return _groupDataByPeriod(last6Months, 30); // 30 günlük gruplar

      case "1year":
        // Yıl için 2 aylık veriler (6 nokta)
        return _groupDataByPeriod(data, 60); // 60 günlük gruplar

      default:
        return data;
    }
  }

  List<WeightData> _groupDataByPeriod(List<WeightData> data, int daysPeriod) {
    if (data.isEmpty) return [];

    final groupedData = <WeightData>[];
    final DateTime endDate = data.last.date;
    DateTime currentDate = data.first.date;

    while (currentDate.isBefore(endDate) ||
        currentDate.isAtSameMomentAs(endDate)) {
      final periodEnd = currentDate.add(Duration(days: daysPeriod));
      final periodData = data
          .where((item) =>
              item.date
                  .isAfter(currentDate.subtract(const Duration(days: 1))) &&
              item.date.isBefore(periodEnd))
          .toList();

      if (periodData.isNotEmpty) {
        // Periyottaki verilerin ortalamasını al
        final averageWeight =
            periodData.map((e) => e.weight).reduce((a, b) => a + b) /
                periodData.length;

        groupedData.add(WeightData(
            currentDate, double.parse(averageWeight.toStringAsFixed(1))));
      }

      currentDate = periodEnd;
    }

    return groupedData;
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon, {
    Color? color,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          color: color ?? SharedConstants.orangeColor,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: color ?? Colors.grey[800],
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

// Add Weight Dialog
class AddWeightDialog extends StatefulWidget {
  const AddWeightDialog({super.key});

  @override
  State<AddWeightDialog> createState() => _AddWeightDialogState();
}

class _AddWeightDialogState extends State<AddWeightDialog> {
  late TextEditingController _weightController;
  late double currentWeight;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    currentWeight = 11.8; // Son kilo verisi
    _weightController =
        TextEditingController(text: currentWeight.toStringAsFixed(1));
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  void _incrementWeight() {
    setState(() {
      currentWeight += 0.1;
      _weightController.text = currentWeight.toStringAsFixed(1);
    });
  }

  void _decrementWeight() {
    if (currentWeight > 0.1) {
      setState(() {
        currentWeight -= 0.1;
        _weightController.text = currentWeight.toStringAsFixed(1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.tr("addNewWeight")),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Tarih seçici (güncelleme için)
          TextButton.icon(
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now(),
              );
              if (date != null) {
                setState(() {
                  selectedDate = date;
                });
              }
            },
            icon: const Icon(Icons.calendar_today),
            label: Text(
              selectedDate != null
                  ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                  : context.tr("selectDate"),
            ),
          ),
          const SizedBox(height: 16),
          // Kilo ayarlama
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _decrementWeight,
                icon: const Icon(Icons.remove_circle_outline),
                color: SharedConstants.orangeColor,
              ),
              Expanded(
                child: TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  cursorColor: SharedConstants.orangeColor,
                  decoration: const InputDecoration(
                    suffixText: "kg",
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: SharedConstants.orangeColor),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      currentWeight = double.parse(value);
                    }
                  },
                ),
              ),
              IconButton(
                onPressed: _incrementWeight,
                icon: const Icon(Icons.add_circle_outline),
                color: SharedConstants.orangeColor,
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            context.tr("cancel"),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: SharedConstants.redColor,
                ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: SharedConstants.orangeColor,
              ),
              onPressed: () {
                if (selectedDate != null) {
                  // Güncelleme
                  ref.read(weightDataProvider.notifier).updateWeight(
                        selectedDate!,
                        currentWeight,
                      );
                } else {
                  // Yeni veri ekleme
                  ref
                      .read(weightDataProvider.notifier)
                      .addWeight(currentWeight);
                }
                Navigator.pop(context);
              },
              child: Text(
                context.tr("save"),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: SharedConstants.whiteColor,
                    ),
              ),
            );
          },
        ),
      ],
    );
  }
}
