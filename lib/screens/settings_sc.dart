import 'package:flutter/material.dart';
import 'package:local_storage/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = 'Settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('settings')),
      drawer: const SideMenu(),
      body: const Center(child: Text('settings')),
    );
  }
}
