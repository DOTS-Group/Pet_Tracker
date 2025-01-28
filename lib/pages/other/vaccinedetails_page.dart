import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/widgets/home/home_page/appbar_widget.dart';

class VaccineDetailsPage extends StatefulWidget {
  const VaccineDetailsPage({super.key});

  @override
  State<VaccineDetailsPage> createState() => _VaccineDetailsPageState();
}

class _VaccineDetailsPageState extends State<VaccineDetailsPage> {
  final TextEditingController _vaccineNameController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      floatingActionButton: FloatingActionButton(
        backgroundColor: SharedConstants.orangeColor,
        onPressed: () {
          _showAddVaccineDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * SharedConstants.paddingGenerall,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const HomePageAppBarWidget(),
              // Upcoming Vaccines
              Text(
                "Yaklaşan Aşılar",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * SharedConstants.paddingGenerall,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        height * SharedConstants.paddingGenerall),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: height * SharedConstants.paddingGenerall,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return VaccineCard(
                        petName: "Poyraz",
                        vaccineName: "Kuduz Aşısı",
                        date: "15 Nisan 2024",
                        time: "14:30",
                        isCompleted: false,
                        onComplete: () {
                          // Aşı tamamlandı işaretleme
                        },
                      );
                    },
                  ),
                ),
              ),

              // Completed Vaccines
              Padding(
                padding: EdgeInsets.only(
                  top: height * SharedConstants.paddingGenerall,
                ),
                child: Text(
                  "Tamamlanan Aşılar",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * SharedConstants.paddingGenerall,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return VaccineCard(
                        petName: "Luna",
                        vaccineName: "Karma Aşı",
                        date: "1 Mart 2024",
                        time: "10:00",
                        isCompleted: true,
                        onComplete: () {},
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showAddVaccineDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.tr("addVaccine")),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _vaccineNameController,
              decoration: InputDecoration(
                labelText: context.tr("vaccineName"),
                border: const OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height *
                    SharedConstants.paddingSmall,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.calendar_today),
                      label: Text(selectedDate.toString().split(' ')[0]),
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2025),
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              controller: _noteController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: context.tr("notes"),
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              context.tr("cancel"),
              style: const TextStyle(color: SharedConstants.redColor),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: SharedConstants.orangeColor,
            ),
            onPressed: () {
              // Aşı ekleme işlemi
              Navigator.pop(context);
            },
            child: Text(context.tr("save")),
          ),
        ],
      ),
    );
  }
}

class VaccineCard extends StatelessWidget {
  final String petName;
  final String vaccineName;
  final String date;
  final String time;
  final bool isCompleted;
  final VoidCallback onComplete;

  const VaccineCard({
    super.key,
    required this.petName,
    required this.vaccineName,
    required this.date,
    required this.time,
    required this.isCompleted,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isCompleted
                  ? SharedConstants.greenColor.withOpacity(0.1)
                  : SharedConstants.orangeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isCompleted ? Icons.check_circle : Icons.vaccines,
              color: isCompleted
                  ? SharedConstants.greenColor
                  : SharedConstants.orangeColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width *
                  SharedConstants.paddingGenerall,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$petName - $vaccineName",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    "$date - $time",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                ),
              ],
            ),
          ),
          if (!isCompleted) ...[
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.check_circle_outline),
              color: SharedConstants.greenColor,
              onPressed: onComplete,
            ),
          ],
        ],
      ),
    );
  }
}
