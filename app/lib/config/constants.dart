/// App-wide constants
class AppConstants {
  // App Info
  static const String appName = 'CareCrate';
  static const String appVersion = '1.0.0';

  // API Configuration
  static const String baseApiUrl = 'http://localhost:8000/api';
  static const String authEndpoint = '/auth';
  static const String packagesEndpoint = '/packages';
  static const String cartEndpoint = '/cart';
  static const String ordersEndpoint = '/orders';

  // Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String userDataKey = 'user_data';
  static const String cartDataKey = 'cart_data';

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double cardBorderRadius = 12.0;
  static const double buttonHeight = 48.0;
}

/// Environment-specific configuration
enum Environment { development, staging, production }

class AppConfig {
  static Environment get environment {
    // This can be set via build flavors or environment variables
    return Environment.development;
  }

  static String get apiBaseUrl {
    switch (environment) {
      case Environment.development:
        return 'http://localhost:8000/api';
      case Environment.staging:
        return 'https://staging-api.carecrate.com/api';
      case Environment.production:
        return 'https://api.carecrate.com/api';
    }
  }

  static bool get isDebugMode => environment == Environment.development;
}
