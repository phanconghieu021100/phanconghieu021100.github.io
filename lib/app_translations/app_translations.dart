import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'vi': {
          'title': 'Xin chào Thế giới',
          'setting': 'Cài đặt',
          'language': 'Ngôn ngữ',
          'tiengviet': 'Tiếng Việt',
          'tienganh': 'Tiếng Anh',
          'tiengtrung': 'Tiếng Trung',
          'theme':"Chủ đề",
          'select':"Chọn",
        },
        'en': {
          'title': 'Hello World',
          'setting': 'Setting',
          'language': 'Language',
          'tiengviet': 'Vietnamese',
          'tienganh': 'English',
          'tiengtrung': 'Chinese',
          'theme':"Theme",
          'select':"Select",


        },
        'zh': {
          'title': '你好，世界',
          'setting': '设置',
          'language': '语言',
          'tiengviet': 'Tiếng Việt',
          'tienganh': '英语',
          'tiengtrung': '中国人',
          'theme':"主题",
          'select':"选择",


        },
      };
}
