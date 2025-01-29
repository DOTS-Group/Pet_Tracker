import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_tracker/controllers/home/calendarpage_controller.dart';
import '../../widgets/general/auth_required_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  String monthName(int month) {
    switch (month) {
      case 1:
        return "Ocak";
      case 2:
        return "Şubat";
      case 3:
        return "Mart";
      case 4:
        return "Nisan";
      case 5:
        return "Mayıs";
      case 6:
        return "Haziran";
      case 7:
        return "Temmuz";
      case 8:
        return "Ağustos";
      case 9:
        return "Eylül";
      case 10:
        return "Ekim";
      case 11:
        return "Kasım";
      case 12:
        return "Aralık";
      default:
        return "Hata";
    }
  }

  DateTime _focusedDay = DateTime.now();
  List<DateTime> _dates = [DateTime.now()];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        try {
          final controller = CalendarPageController();
          controller.checkAuth(ref);
          double height = MediaQuery.of(context).size.height;
          double width = MediaQuery.of(context).size.width;

          return Column(
            children: [
              // Calendar Date Picker
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  selectedDayTextStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                  weekdayLabelTextStyle: Theme.of(context).textTheme.bodyMedium,
                  dayTextStyle: Theme.of(context).textTheme.bodyMedium,
                  selectedDayHighlightColor: Colors.orange,
                ),
                value: _dates,
                onValueChanged: (dates) {
                  setState(() {
                    _dates = dates;
                    if (_dates.isNotEmpty) {
                      _focusedDay = _dates.first;
                    }
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * SharedConstants.paddingGenerall,
                ),
                child: Column(
                  children: [
                    // Selected Date Container
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            height * SharedConstants.paddingGenerall),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: height * SharedConstants.paddingGenerall,
                          horizontal: width * SharedConstants.paddingGenerall,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Selected Date
                            Text(
                              "${_focusedDay.day} ${monthName(_focusedDay.month)}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            // Expanded ListView.builder
                            // Expanded(
                            //   child: ListView.builder(
                            //     itemCount: 5,
                            //     itemBuilder: (context, index) {
                            //       return ListTile(
                            //         title: Text("Title $index"),
                            //         subtitle: Text("Subtitle $index"),
                            //       );
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    // Activity Add Button
                    Padding(
                      padding: EdgeInsets.only(
                        top: height * SharedConstants.paddingGenerall,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/reminder');
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  height * SharedConstants.paddingGenerall,
                            ),
                            child: const Icon(Icons.add, color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } catch (e) {
          return const AuthRequiredWidget();
        }
      },
    );
  }
}
