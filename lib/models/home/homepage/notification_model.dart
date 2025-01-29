import 'package:flutter/material.dart';
import '../../../shared/constants_shared.dart';

class NotificationModel {
  final String notificationId;
  final String title;
  final String description;
  final DateTime time;
  final NotificationType type;
  final String? redirectPath;
  final String? clinicId;

  NotificationModel({
    required this.notificationId,
    required this.title,
    required this.description,
    required this.time,
    required this.type,
    this.redirectPath,
    this.clinicId,
  });

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} yıl önce';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} ay önce';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} gün önce';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} saat önce';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} dakika önce';
    } else {
      return 'Az önce';
    }
  }
}

enum NotificationType {
  vaccine(Icons.vaccines, SharedConstants.blueColor),
  medicine(Icons.medication, SharedConstants.orangeColor),
  campaign(Icons.local_offer, SharedConstants.greenColor);

  final IconData icon;
  final Color color;

  const NotificationType(this.icon, this.color);
}
