import 'package:flutter_training/ui/screen/todo/model/todo_model.dart';
import 'package:flutter_training/util/common.dart';
import 'package:flutter_training/util/device_info_util.dart';
import 'package:flutter_training/util/in_app_notication_service.dart';
import 'package:flutter_training/util/localization_service.dart';
import 'package:flutter_training/util/notification_service.dart';
import 'package:flutter_training/util/shared_preference.dart';
import 'package:flutter_training/util/supabase_config.dart';

class TodoService {
  static Future<String> _getDeviceId() async {
    var deviceUDID = await SharedPreferenceUtil.getDeviceUDID();
    if (deviceUDID != null) return deviceUDID;
    deviceUDID = await DeviceInfoUtil.getDeviceId();
    await SharedPreferenceUtil.saveDeviceUDID(deviceUDID);
    return deviceUDID;
  }

  static Future<void> addTodo(TodoModel model) async {
    try {
      final deviceId = await _getDeviceId();

      final data = model.toJson();
      data['device_id'] = deviceId;

      print('[addTodo] insert data: $data');

      final res = await SupabaseConfig.client.from('todos').insert(data);
      print('[addTodo] response: $res');
    } catch (e) {
      print('[addTodo] ERROR: $e');
      rethrow;
    }
  }

  static Future<List<TodoModel>> fetchTodos({required bool completed}) async {
    try {
      final deviceId = await _getDeviceId();

      final response = await SupabaseConfig.client
          .from('todos')
          .select()
          .eq('device_id', deviceId)
          .eq('completed', completed)
          .order('created_at', ascending: false);

      print('[fetchTodos] fetched data: $response');

      return (response as List)
          .map((json) => TodoModel.fromJson(json))
          .toList();
    } catch (e) {
      print('[fetchTodos] ERROR: $e');
      rethrow;
    }
  }

  static Future<void> updateTodo(TodoModel model) async {
    if (model.id == null) {
      print('[updateTodo] ID is null — skipping update');
      return;
    }

    try {
      final updateData = model.toJson();

      print('[updateTodo] Updating id=${model.id}, data=$updateData');

      final res = await SupabaseConfig.client
          .from('todos')
          .update(updateData)
          .eq('id', model.id as Object);

      print('[updateTodo] response: $res');
    } catch (e) {
      print('[updateTodo] ERROR: $e');
      rethrow;
    }
  }

  static Future<void> updateTodoStatus(String id, bool completed) async {
    try {
      print('[updateTodoStatus] id=$id, completed=$completed');

      final res = await SupabaseConfig.client
          .from('todos')
          .update({'completed': completed})
          .eq('id', id);

      print('[updateTodoStatus] response: $res');
    } catch (e) {
      print('[updateTodoStatus] ERROR: $e');
      rethrow;
    }
  }

  static Future<void> deleteTodo(String id) async {
    try {
      print('[deleteTodo] Deleting id=$id');

      final res = await SupabaseConfig.client
          .from('todos')
          .delete()
          .eq('id', id);

      print('[deleteTodo] response: $res');
    } catch (e) {
      print('[deleteTodo] ERROR: $e');
      rethrow;
    }
  }

  static Future<void> scheduleTodoNotification(TodoModel todo) async {
    if (todo.date == null || todo.time == null) return;

    final timeParts = todo.time!.split(":");
    final scheduledDateTime = DateTime(
      todo.date!.year,
      todo.date!.month,
      todo.date!.day,
      int.parse(timeParts[0]),
      int.parse(timeParts[1]),
    );

    if (scheduledDateTime.isBefore(DateTime.now())) return;
    await NotificationService.showScheduledNotification(
      id: todo.id.hashCode,
      title: LocalizationService.current.todo,
      body: todo.taskTitle ?? 'You have a task!',
      scheduledDateTime: scheduledDateTime,
    );
  }

  static Future<void> cancelTodoNotification(TodoModel todo) async {
    await NotificationService.cancelNotification(todo.id.hashCode);
  }

  static Future<void> cancelAllScheduledNotifications() async {
    await NotificationService.cancelAllScheduledNotifications();
  }

  static void scheduleInAppNotification(TodoModel todo) {
    final data = InAppNotificationData(
      id: todo.id!,
      title: LocalizationService.current.todo,
      message: todo.taskTitle ?? 'N/A',
      time: Common.parseTodoTimeToday(todo.time!),
    );
    InAppNotificationService.scheduleInAppNotification(data);
  }

  static void cancelInAppNotification(TodoModel todo) {
    InAppNotificationService.cancel(todo.id!);
  }

  static void cancelAllInAppNotifications() {
    InAppNotificationService.cancelAll();
  }
}
