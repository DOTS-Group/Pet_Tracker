import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import '../../models/home/homepage/notification_model.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<NotificationModel> notifications = [
    NotificationModel(
      notificationId: '1',
      title: "Max'in Aşı Zamanı",
      description: "Kuduz aşısı için randevu zamanı yaklaşıyor",
      time: DateTime.now().subtract(const Duration(hours: 2)),
      type: NotificationType.vaccine,
    ),
    NotificationModel(
      notificationId: '2',
      title: "Tedavi Hatırlatması",
      description: "Luna'nın ilaç saati geldi",
      time: DateTime.now().subtract(const Duration(hours: 5)),
      type: NotificationType.medicine,
    ),
    NotificationModel(
      notificationId: '3',
      title: "Özel Kampanya",
      description: "Pet Shop'ta mama ürünlerinde %20 indirim!",
      time: DateTime.now().subtract(const Duration(days: 1)),
      type: NotificationType.campaign,
      redirectPath: "/market",
      clinicId: "12345",
    ),
  ];

  void _deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  void _deleteAllNotifications() {
    setState(() {
      notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pushReplacementNamed(context, "/pattern"),
        ),
        actions: [
          if (notifications.isNotEmpty)
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(context.tr("deleteAll")),
                    content: Text(context.tr("deleteAllConfirm")),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          context.tr("cancel"),
                          style:
                              const TextStyle(color: SharedConstants.redColor),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: SharedConstants.orangeColor,
                        ),
                        onPressed: () {
                          _deleteAllNotifications();
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
                style: const TextStyle(color: SharedConstants.redColor),
              ),
            ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(
              child: Text(
                context.tr("noNotifications"),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height *
                    SharedConstants.paddingGenerall,
              ),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height *
                        SharedConstants.paddingGenerall,
                  ),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) => _deleteNotification(index),
                          backgroundColor: SharedConstants.redColor,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: context.tr("delete"),
                        ),
                      ],
                    ),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height *
                              SharedConstants.paddingGenerall,
                        ),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.height *
                              SharedConstants.paddingGenerall,
                        ),
                        onTap: () {
                          if (notification.redirectPath != null) {
                            Navigator.pushNamed(
                              context,
                              notification.redirectPath!,
                              arguments: notification.clinicId,
                            );
                          } else {
                            Navigator.pushNamed(
                              context,
                              "/notificationdetails",
                              arguments: notification,
                            );
                          }
                        },
                        leading: Container(
                          padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height *
                                SharedConstants.paddingGenerall,
                          ),
                          decoration: BoxDecoration(
                            color:
                                notification.type.color.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height *
                                  SharedConstants.paddingGenerall,
                            ),
                          ),
                          child: Icon(
                            notification.type.icon,
                            color: notification.type.color,
                          ),
                        ),
                        title: Text(
                          notification.title,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height *
                                    SharedConstants.paddingSmall,
                              ),
                              child: Text(
                                notification.description,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height *
                                    SharedConstants.paddingSmall,
                              ),
                              child: Text(
                                notification.timeAgo,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
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
