import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:funfacts_provider/widget/theme_switcher.dart';
// import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Column(children: [ThemeSwitcher()]),
    );
  }
}
