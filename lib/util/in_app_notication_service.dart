import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/main.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';

class InAppNotificationData {
  final String id;
  final String title;
  final String message;
  final DateTime time;
  final String? route;
  final Map<String, dynamic>? arguments;

  InAppNotificationData({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    this.route,
    this.arguments,
  });
}

class InAppNotificationService {
  static final Map<String, Timer> _timers = {};

  static void scheduleInAppNotification(InAppNotificationData data) {
    final diff = data.time.difference(DateTime.now());
    if (diff.isNegative) return;

    cancel(data.id);

    final timer = Timer(diff, () {
      _show(data);
      _timers.remove(data.id);
    });

    _timers[data.id] = timer;
  }

  static void _show(InAppNotificationData data) {
    final context = NavigationService.navigatorKey.currentContext;
    if (context != null) {
      Flushbar(
        icon: const Icon(Icons.alarm_on_rounded, color: AppColors.white, size: 30),
        titleText: BaseTextLabel(
          data.title,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
        messageText: BaseTextLabel(
          data.message,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
        duration: const Duration(seconds: 5),
        margin: const EdgeInsets.all(10),
        borderRadius: BorderRadius.circular(20),
        backgroundColor: AppColors.todoLightPurple,
        flushbarPosition: FlushbarPosition.TOP,
        onTap: (flushBar) {
          if (data.route != null) {
            Navigator.pushNamed(context, data.route!, arguments: data.arguments);
          }
          flushBar.dismiss();
        },
      ).show(context);
    }
  }

  static void cancel(String id) {
    final timer = _timers[id];
    if (timer != null && timer.isActive) {
      timer.cancel();
    }
    _timers.remove(id);
  }

  static void cancelAll() {
    for (final timer in _timers.values) {
      if (timer.isActive) timer.cancel();
    }
    _timers.clear();
  }
}
