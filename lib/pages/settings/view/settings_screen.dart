import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubehealth/pages/settings/controller/setting_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final settingController = Get.find<SettingController>();

  @override
  void initState() {
    settingController.onPageInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(
              alignment: Alignment.center,
              child: ObxValue(
                (data) => Text(
                  settingController.isLightTheme.value
                    ? "Light theme"
                    : "Dark theme",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                false.obs,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ObxValue(
              (data) => Icon(
                settingController.isLightTheme.value
                    ? Icons.brightness_high
                    : Icons.nights_stay,
              ),
              false.obs,
            ),
          ),
        ],
      ),
      body: ObxValue(
          (data) => SettingsList(
                sections: [
                  SettingsSection(
                    title: const Text('Common'),
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        leading: const Icon(Icons.language),
                        title: const Text('Language'),
                        value: const Text('English'),
                      ),
                      SettingsTile.switchTile(
                        onToggle: (value) {
                          settingController.setThemeManually(value);
                        },
                        initialValue: settingController.isLightTheme.value,
                        leading: const Icon(Icons.format_paint),
                        title: const Text('Toggle theme'),
                      ),
                      SettingsTile.navigation(
                        leading: const Icon(Icons.double_arrow),
                        title: const Text('Navigate to next page'),
                        value: const Text('Using Getx'),
                        onPressed: (context){
                          settingController.navigateToPage("/home");
                        },
                      ),
                    ],
                  ),
                ],
              ),
          false.obs),
    );
  }
}
