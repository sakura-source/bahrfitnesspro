import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  Future<void> logEvent(String name, {Map<String, dynamic> parameters}) async {
    await _analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  Future<void> setUserId(String userId) async {
    await _analytics.setUserId(userId);
  }

  Future<void> setUserProperty(String name, String value) async {
    await _analytics.setUserProperty(
      name: name,
      value: value,
    );
  }

  Future<void> logLogin() async {
    await _analytics.logLogin();
  }

  Future<void> logSignUp() async {
    await _analytics.logSignUp();
  }

  Future<void> logPurchase({double value, String currency}) async {
    await _analytics.logEvent(
      name: 'purchase',
      parameters: {
        'value': value,
        'currency': currency,
      },
    );
  }
}
