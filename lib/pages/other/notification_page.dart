import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<NotificationItem> notifications = [
      NotificationItem(
        title: "Max'in Aşı Zamanı",
        description: "Kuduz aşısı için randevu zamanı yaklaşıyor",
        time: "2 saat önce",
        type: NotificationType.vaccine,
      ),
      NotificationItem(
        title: "Tedavi Hatırlatması",
        description: "Luna'nın ilaç saati geldi",
        time: "5 saat önce",
        type: NotificationType.medicine,
      ),
      NotificationItem(
        title: "Özel Kampanya",
        description: "Pet Shop'ta mama ürünlerinde %20 indirim!",
        time: "1 gün önce",
        type: NotificationType.campaign,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Tüm bildirimleri silme işlemi
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(context.tr("deleteAll")),
                  content: const Text(
                      "Tüm bildirimleri silmek istediğinize emin misiniz?"),
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
                        // Silme işlemi
                        Navigator.pop(context);
                      },
                      child: Text(context.tr("delete")),
                    ),
                  ],
                ),
              );
            },
            child: Text(
              context.tr("deleteAll"),
              style: TextStyle(color: SharedConstants.redColor),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * SharedConstants.paddingGenerall,
              vertical: height * SharedConstants.paddingSmall,
            ),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      // Silme işlemi
                    },
                    backgroundColor: SharedConstants.redColor,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Sil',
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, "/notificationdetails"),
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
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        // İkon
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: notification.type.color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            notification.type.icon,
                            color: notification.type.color,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // İçerik
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                notification.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                notification.time,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.grey[400],
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String description;
  final String time;
  final NotificationType type;

  NotificationItem({
    required this.title,
    required this.description,
    required this.time,
    required this.type,
  });
}

enum NotificationType {
  vaccine(Icons.vaccines, SharedConstants.blueColor),
  medicine(Icons.medication, SharedConstants.orangeColor),
  campaign(Icons.local_offer, SharedConstants.greenColor);

  final IconData icon;
  final Color color;

  const NotificationType(this.icon, this.color);
}
