import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'title': 'Hello World',
          'setting':'Setting'
        },
        'vi': {
          'title': 'Xin chào Thế giới',
          'setting':'Cài đặt'
        },
         'zh': {
          'title': '你好，世界',
          'setting': '设置',
        },
      };
}