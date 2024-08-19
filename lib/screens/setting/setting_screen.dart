import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/fonts/fonts.dart';
import 'package:phanconghieu020100/local/localization_service.dart';
import 'package:phanconghieu020100/screens/setting/setting_controller.dart';
import 'package:phanconghieu020100/theme/theme_controller.dart';
import 'package:phanconghieu020100/utils/colors.dart';
import 'package:phanconghieu020100/utils/common_buttonsheet.dart';
import 'package:phanconghieu020100/utils/drop_down.dart';
import 'package:phanconghieu020100/utils/example_drop_down/data_demo.dart';
import 'package:phanconghieu020100/utils/title_close.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final SettingController controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('a'),
          Obx(
            () => Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showCommonBottomSheet(
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TitleCloseWidget(title: 'language'.tr),
                              const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Divider(
                                  thickness: 0.1,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                  LocalizationService().changeLocale('vi');
                                  controller.updateLanguage('vi');
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.transparent,
                                            child: ClipOval(
                                              child: Image.asset(
                                                'assets/images/vietnam.png', // Đường dẫn đến ảnh
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'tiengviet'.tr,
                                            style: controller.fontController
                                                .currentFontStyle,
                                          ),
                                        ],
                                      ),
                                      if (controller.islanguage.value ==
                                          'vi') ...[
                                        Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.red),
                                        )
                                      ]
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Divider(
                                  thickness: 0.1,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                  LocalizationService().changeLocale('en');
                                  controller.updateLanguage('en');
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.transparent,
                                            child: ClipOval(
                                              child: Image.asset(
                                                'assets/images/america.png', // Đường dẫn đến ảnh
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'tienganh'.tr,
                                            style: controller.fontController
                                                .currentFontStyle,
                                          ),
                                        ],
                                      ),
                                      if (controller.islanguage.value ==
                                          'en') ...[
                                        Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.red),
                                        )
                                      ]
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Divider(
                                  thickness: 0.1,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                  LocalizationService().changeLocale('zh');
                                  controller.updateLanguage('zh');
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.transparent,
                                            child: ClipOval(
                                              child: Image.asset(
                                                'assets/images/tungqu.jpg',
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'tiengtrung'.tr,
                                            style: controller.fontController
                                                .currentFontStyle,
                                          ),
                                        ],
                                      ),
                                      if (controller.islanguage.value ==
                                          'zh') ...[
                                        Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.red),
                                        )
                                      ]
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                          isScrollControlled: true,
                        );
                      },
                      child: ClipOval(
                        child: Image.asset(
                          (controller.islanguage.value == 'vi')
                              ? 'assets/images/vietnam.png'
                              : (controller.islanguage.value == 'zh')
                                  ? 'assets/images/tungqu.jpg'
                                  : 'assets/images/america.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        showCommonBottomSheet(
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TitleCloseWidget(title: 'theme'.tr),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Divider(
                                    thickness: 0.1,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.themeController
                                        .changeTheme(AppTheme.light);
                                    controller.updateThemeMode('light');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'Light',
                                              style: controller.fontController
                                                  .currentFontStyle,
                                            ),
                                          ],
                                        ),
                                        if (controller.isThemeMode.value ==
                                            'light') ...[
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red),
                                          )
                                        ]
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Divider(
                                    thickness: 0.1,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.themeController
                                        .changeTheme(AppTheme.dark);
                                    controller.updateThemeMode('dark');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'Dark',
                                              style: controller.fontController
                                                  .currentFontStyle,
                                            ),
                                          ],
                                        ),
                                        if (controller.isThemeMode.value ==
                                            'dark') ...[
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red),
                                          )
                                        ]
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Divider(
                                    thickness: 0.1,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.themeController
                                        .changeTheme(AppTheme.custom);
                                    controller.updateThemeMode('custom');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.active,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'Custom',
                                              style: controller.fontController
                                                  .currentFontStyle,
                                            ),
                                          ],
                                        ),
                                        if (controller.isThemeMode.value ==
                                            'custom') ...[
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red),
                                          )
                                        ]
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                            isScrollControlled: true,
                            backgroundColor: Colors.grey.shade300);
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.active, shape: BoxShape.circle),
                          height: 50,
                          width: 50,
                          child: Center(
                            child: AutoSizeText(
                              'Chọn',
                              style: controller.fontController.currentFontStyle,
                              maxLines: 2,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(() {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        margin: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: BuildDropDownV2<String>(
                                currentValue: controller
                                    .fontController.selectedFontKey.value,
                                childs: [
                                  DropdownMenuItem(
                                    value: 'roboto',
                                    child: Text(
                                      'Roboto',
                                      style: AppFonts.roboto(
                                          color: controller.fontController
                                                      .selectedFontKey.value ==
                                                  'roboto'
                                              ? Colors.red
                                              : Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'lato',
                                    child: Text(
                                      'Lato',
                                      style: AppFonts.lato(
                                          color: controller.fontController
                                                      .selectedFontKey.value ==
                                                  'lato'
                                              ? Colors.red
                                              : Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'pacifico',
                                    child: Text(
                                      'Pacifico',
                                      style: AppFonts.pacifico(
                                          color: controller.fontController
                                                      .selectedFontKey.value ==
                                                  'pacifico'
                                              ? Colors.red
                                              : Colors.black),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'quicksan',
                                    child: Text(
                                      'Quicksan',
                                      style: AppFonts.quicksan(
                                          color: controller.fontController
                                                      .selectedFontKey.value ==
                                                  'quicksan'
                                              ? Colors.red
                                              : Colors.black),
                                    ),
                                  ),
                                ],
                                hintText: 'Select Font',
                                onChange: (value) {
                                  if (value != null) {
                                    controller.fontController.changeFont(value);
                                  }
                                },
                                showClearIcon: false,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Obx(
                        () => BuildDropDownV3<String>(
                          listQueues: lstQueues,
                          currentValue: controller.selectedQueue.value?.value,
                          hintText: 'select'.tr,
                          onChange: (value) {
                            var selectedQueueItem = lstQueues.firstWhere(
                              (item) => item.value == value,
                              orElse: () => QueueItem(
                                value: '',
                                text: '',
                                description: '',
                              ),
                            );
                            controller.selectedQueue.value = selectedQueueItem;

                            print('${controller.selectedQueue.value?.value}');
                          },
                          childs: lstQueues
                              .map<DropdownMenuItem<String>>(
                                (item) => DropdownMenuItem<String>(
                                  value: item.value,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.text,
                                        style: controller
                                            .fontController.currentFontStyle
                                            .copyWith(
                                          color: AppColors.pinkText,
                                        ),
                                      ),
                                      Text(
                                        item.description,
                                        style: controller
                                            .fontController.currentFontStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                          showClearIcon:
                              (controller.selectedQueue.value?.value != '')
                                  ? true
                                  : false,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(width: 1, color: AppColors.border)),
                      child: Obx(
                        () => BuildDropDownV2<CodeName>(
                            currentValue:
                                (controller.agencyStatus.value != null)
                                    ? statusAgency(
                                        controller.agencyStatus.value ?? '')
                                    : CodeName("SIGNED", "Ký hợp đồng"),
                            hintText: 'select'.tr,
                            onChange: (value) {
                              controller.agencyStatus.value = value!.code;
                              // controller.agencyStatus.refresh();
                            },
                            childs: statusAgenciesVN
                                .map<DropdownMenuItem<CodeName>>(
                                  (status) => DropdownMenuItem(
                                      value: status,
                                      child: Text(
                                        status.name,
                                        style: controller
                                            .fontController.currentFontStyle,
                                      )),
                                )
                                .toList()),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Obx(
                        () => BuildDropDownV2<String>(
                          currentValue: controller.passengersTitleValue.value,
                          hintText: 'select'.tr,
                          onChange: (value) {
                            controller.passengersTitleValue.value = value;
                            print(value);
                          },
                          childs: passengerTitles
                              .map<DropdownMenuItem<String>>(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item,
                                        style: controller
                                            .fontController.currentFontStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                          showClearIcon:
                              (controller.passengersTitleValue.value != '')
                                  ? true
                                  : false,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.colorController.changeColor(Colors.blue);
                        },
                        child: Text('blue')),
                    ElevatedButton(
                      onPressed: () {
                        controller.colorController.changeColor(Colors.red);
                      },
                      child: Text('đỏ'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.colorController.changeColor(Colors.blue);
                        },
                        child: Text('blue')),
                    ElevatedButton(
                      onPressed: () {
                        controller.colorController.changeColor(Colors.red);
                      },
                      child: Text('đỏ'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.colorController.changeColor(Colors.blue);
                        },
                        child: Text('blue')),
                    ElevatedButton(
                      onPressed: () {
                        controller.colorController.changeColor(Colors.red);
                      },
                      child: Text('đỏ'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.colorController.changeColor(Colors.blue);
                        },
                        child: Text('blue')),
                    ElevatedButton(
                      onPressed: () {
                        controller.colorController.changeColor(Colors.red);
                      },
                      child: Text('đỏ'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.colorController.changeColor(Colors.blue);
                        },
                        child: Text('blue')),
                    ElevatedButton(
                      onPressed: () {
                        controller.colorController.changeColor(Colors.red);
                      },
                      child: Text('đỏ'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.colorController.changeColor(Colors.blue);
                        },
                        child: Text('blue')),
                    ElevatedButton(
                      onPressed: () {
                        controller.colorController.changeColor(Colors.red);
                      },
                      child: Text('đỏ'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.colorController.changeColor(Colors.blue);
                        },
                        child: Text('blue')),
                    ElevatedButton(
                      onPressed: () {
                        controller.colorController.changeColor(Colors.red);
                      },
                      child: Text('đỏ'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.colorController.changeColor(Colors.blue);
                        },
                        child: Text('blue')),
                    ElevatedButton(
                      onPressed: () {
                        controller.colorController.changeColor(Colors.red);
                      },
                      child: Text('đỏ'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.colorController.changeColor(Colors.blue);
                        },
                        child: Text('blue')),
                    ElevatedButton(
                      onPressed: () {
                        controller.colorController.changeColor(Colors.red);
                      },
                      child: Text('đỏ'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.colorController.changeColor(Colors.blue);
                        },
                        child: Text('blue')),
                    ElevatedButton(
                      onPressed: () {
                        controller.colorController.changeColor(Colors.red);
                      },
                      child: Text('đỏ'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
