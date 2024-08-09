import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/fonts/font_controller.dart';
import 'package:phanconghieu020100/localization_service.dart';
import 'package:phanconghieu020100/screens/setting_controller.dart';
import 'package:phanconghieu020100/theme/theme_controller.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  //
  final ThemeController themeController = Get.find<ThemeController>();
  final SettingController controllerSetting2 = Get.put(SettingController());
  final SettingController controllerSetting = Get.find();
  final FontController fontController = Get.find<FontController>();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        controllerSetting.selectedButtonIndex.value == 0
                            ? Colors.red
                            : Colors.white)),
                onPressed: () {
                  LocalizationService().changeLocale('en');
                  controllerSetting.selectButton(0);
                },
                child: Text('English'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        controllerSetting.selectedButtonIndex.value == 1
                            ? Colors.red
                            : Colors.white)),
                onPressed: () {
                  LocalizationService().changeLocale('vi');
                  controllerSetting.selectButton(1);
                },
                child: Text('Tiếng Việt'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        controllerSetting.selectedButtonIndex.value == 2
                            ? Colors.red
                            : Colors.white)),
                onPressed: () {
                  LocalizationService().changeLocale('zh');
                  controllerSetting.selectButton(2);
                },
                child: Text('Trung Quốc'),
              ),
              ListTile(
                title: Text('Light Theme'),
                onTap: () {
                  themeController.changeTheme(AppTheme.light);
                },
              ),
              ListTile(
                title: Text('Dark Theme'),
                onTap: () {
                  themeController.changeTheme(AppTheme.dark);
                },
              ),
              ListTile(
                title: Text('Custom Theme'),
                onTap: () {
                  themeController.changeTheme(AppTheme.custom);
                },
              ),
              Obx(() {
                return DropdownButton<String>(
                  value: fontController.selectedFontKey.value,
                  items: [
                    DropdownMenuItem(value: 'roboto', child: Text('Roboto')),
                    DropdownMenuItem(value: 'lato', child: Text('Lato')),
                     DropdownMenuItem(
                        value: 'pacifico', child: Text('pacifico')),
                    DropdownMenuItem(
                        value: 'quicksan', child: Text('Quicksan')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      fontController.changeFont(value);
                    }
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
