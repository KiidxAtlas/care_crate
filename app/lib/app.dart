import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/themes/app_theme.dart';

class CareCrateApp extends ConsumerWidget {
  const CareCrateApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'CareCrate',
      theme: AppTheme.darkTheme,
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite, size: 64, color: Colors.teal),
              SizedBox(height: 16),
              Text(
                'Welcome to CareCrate',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('Care packages made with love'),
            ],
          ),
        ),
      ),
    );
  }
}
