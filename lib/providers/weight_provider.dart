import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/weight_data.dart';

final weightDataProvider =
    StateNotifierProvider<WeightDataNotifier, List<WeightData>>((ref) {
  return WeightDataNotifier();
});

class WeightDataNotifier extends StateNotifier<List<WeightData>> {
  WeightDataNotifier() : super(_generateYearlyData());

  static List<WeightData> _generateYearlyData() {
    final List<WeightData> yearlyData = [];
    final DateTime now = DateTime.now();
    double baseWeight = 55.0; // Rottweiler için başlangıç kilosu

    // Son 365 gün için veri oluştur
    for (int i = 365; i >= 0; i--) {
      // Küçük rastgele dalgalanmalar ekle (-0.3 ile +0.3 kg arası)
      final randomVariation =
          (DateTime.now().millisecondsSinceEpoch % 7 - 3) / 10;
      final weight = baseWeight + randomVariation;

      yearlyData.add(
        WeightData(
          now.subtract(Duration(days: i)),
          double.parse(weight.toStringAsFixed(1)),
        ),
      );

      // Her 30 günde bir çok küçük temel değişiklik
      if (i % 30 == 0) {
        baseWeight += (DateTime.now().millisecondsSinceEpoch % 3 - 1) / 10;
      }
    }

    return yearlyData;
  }

  void addWeight(double weight) {
    state = [...state, WeightData(DateTime.now(), weight)];
  }

  void updateWeight(DateTime date, double newWeight) {
    state = [
      for (final data in state)
        if (data.date == date) WeightData(date, newWeight) else data
    ];
  }

  void deleteWeight(DateTime date) {
    state = state.where((data) => data.date != date).toList();
  }
}
