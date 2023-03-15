import 'package:flutter/material.dart';
import 'package:local_storage/preferences/preferences.dart';
import 'package:local_storage/providers/theme_provider.dart';
import 'package:local_storage/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = 'Settings';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkMode = false;
  // String initialName = 'Abel';
  // int gender = 1;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('settings')),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              const Divider(),
              SwitchListTile.adaptive(
                title: const Text('Darkmode'),
                value: Preferences.isDarkMode,
                onChanged: (value) {
                  Preferences.isDarkMode = value;
                  if (value) {
                    themeProvider.setDarkMode();
                  } else {
                    themeProvider.setLightMode();
                  }
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                title: const Text('Masculino'),
                groupValue: Preferences.gender,
                value: 1,
                onChanged: (value) {
                  setState(() {
                    Preferences.gender = value!;
                  });
                },
              ),
              const Divider(),
              RadioListTile<int>(
                title: const Text('Femenino'),
                groupValue: Preferences.gender,
                value: 2,
                onChanged: (value) {
                  setState(() {
                    Preferences.gender = value!;
                  });
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      Preferences.name = value;
                    });
                  },
                  initialValue: Preferences.name,
                  decoration: const InputDecoration(
                    label: Text('Nombre'),
                    helperText: 'Nombre del usuario',
                  ),
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
