import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:bahrfitnesspro/services/notification_service.dart';

class MockFlutterLocalNotificationsPlugin extends Mock implements FlutterLocalNotificationsPlugin {}

void main() {
  group('NotificationService', () {
    MockFlutterLocalNotificationsPlugin mockFlutterLocalNotificationsPlugin;
    NotificationService notificationService;

    setUp(() {
      mockFlutterLocalNotificationsPlugin = MockFlutterLocalNotificationsPlugin();
      notificationService = NotificationService();
      notificationService.flutterLocalNotificationsPlugin = mockFlutterLocalNotificationsPlugin;
    });

    test('initialize initializes the notification plugin', () async {
      await notificationService.initialize();

      verify(mockFlutterLocalNotificationsPlugin.initialize(any)).called(1);
    });

    test('scheduleNotification schedules a notification', () async {
      final DateTime scheduledTime = DateTime.now().add(Duration(seconds: 5));

      await notificationService.scheduleNotification(1, 'Test Title', 'Test Body', scheduledTime);

      verify(mockFlutterLocalNotificationsPlugin.schedule(
        1,
        'Test Title',
        'Test Body',
        scheduledTime,
        any,
      )).called(1);
    });

    test('showNotification shows a notification', () async {
      await notificationService.showNotification(1, 'Test Title', 'Test Body');

      verify(mockFlutterLocalNotificationsPlugin.show(
        1,
        'Test Title',
        'Test Body',
        any,
      )).called(1);
    });
  });
}
