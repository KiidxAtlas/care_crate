sickly_app/
├── android/
├── ios/
├── assets/
│   ├── fonts/
│   └── images/
├── test/
│   └── ...                          # mirror of lib/ for unit & widget tests
└── lib/
    ├── main.dart                    # wraps App in ProviderScope
    ├── app.dart                     # MaterialApp + router/navigation
    ├── config/                      # env flavors, constants, endpoints
    │   ├── app_config.dart
    │   └── constants.dart
    ├── core/                        # cross-cutting utilities & widgets
    │   ├── error/
    │   ├── models/                  # e.g. User, CarePackage
    │   ├── services/                # HTTP client, logger, network_info
    │   ├── themes/
    │   └── widgets/
    ├── providers/                   # any global or shared providers
    │   └── logger_provider.dart
    └── features/                    # feature modules
        ├── auth/
        │   ├── data/                # data sources & repo implementations
        │   │   ├── auth_remote.dart
        │   │   └── auth_repository.dart
        │   ├── domain/              # entities & use-cases
        │   │   ├── entities/
        │   │   └── usecases/
        │   ├── providers/           # Riverpod providers & notifiers
        │   │   ├── auth_notifier.dart
        │   │   └── auth_providers.dart
        │   └── presentation/
        │       ├── pages/           # e.g. LoginPage, SignupPage
        │       └── widgets/         # auth-specific UI components
        ├── packages/
        │   ├── data/
        │   ├── domain/
        │   ├── providers/
        │   └── presentation/
        ├── cart/
        │   ├── data/
        │   ├── domain/
        │   ├── providers/
        │   └── presentation/
        ├── checkout/
        │   ├── data/
        │   ├── domain/
        │   ├── providers/
        │   └── presentation/
        ├── orders/
        │   ├── data/
        │   ├── domain/
        │   ├── providers/
        │   └── presentation/
        └── profile/
            ├── data/
            ├── domain/
            ├── providers/
            └── presentation/
