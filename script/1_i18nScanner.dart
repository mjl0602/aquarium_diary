// 导入dart:io库，用于文件操作

import 'dart:io';

/// 模板路径
Uri libPath = Platform.script.resolve('../lib/');

// 定义一个函数，接受一个文件夹路径作为参数，返回一个结果数组
void findChineseStrings(String folderPath) {
  // 创建一个空数组，用于存储结果
  List<String> result = [];
  // 创建一个文件夹对象
  Directory folder = Directory(folderPath);
  // 判断文件夹是否存在
  if (folder.existsSync()) {
    // 获取文件夹下所有的文件和子文件夹
    List<FileSystemEntity> files = folder.listSync();
    // 遍历每一个文件或子文件夹
    for (var file in files) {
      if (file.path.contains('l10n')) continue;
      // 如果是文件，并且扩展名是.dart
      if (file is File && file.path.endsWith('.dart')) {
        if (file.path.contains('bleConnection')) continue;
        if (file.path.contains('bleTest')) continue;
        // 读取文件的所有行
        List<String> lines = file.readAsLinesSync();
        bool hasMatch = false;
        bool i18nDisabled = false;
        // 遍历每一行
        for (int i = 0; i < lines.length; i++) {
          // 获取当前行
          String line = lines[i];
          if (line.contains('!no-i18n-start')) {
            i18nDisabled = true;
          }
          if (line.contains('!no-i18n-end')) {
            i18nDisabled = false;
          }
          if (i18nDisabled) continue;
          // 定义一个正则表达式，匹配中文字符串，单引号或双引号
          RegExp regex = RegExp("['\"].+['\"]");
          // 如果当前行包含中文字符串
          if (regex.hasMatch(line)) {
            if (line.contains('FlowLog')) continue;
            if (line.contains('print(')) continue;
            if (line.contains('logger.add(')) continue;
            if (line.contains('.log(')) continue;
            if (line.contains('.error(')) continue;
            if (line.contains('.end(')) continue;
            if (line.contains('import ')) continue;
            if (line.contains('[开发用]')) continue;
            if (line.contains('[调试]')) continue;
            if (line.contains('[BLE]')) continue;
            if (line.contains('[ble]')) continue;
            if (line.contains('assert')) continue;
            if (line.contains('throw ')) continue;
            if (line.startsWith('//')) continue;
            if (line.startsWith(RegExp(r'\s+//'))) continue;
            if (!checkZh(line)) continue;
            // 将文件路径，行数，和当前行拼接成一个字符串，添加到结果数组中
            result.add(
                '${file.path.replaceAll(libPath.path, '/')}:::${i + 1}:::$line');
            hasMatch = true;
          }
        }
        // if (hasMatch) result.add('');
        if (hasMatch) {
          String fileName =
              '${file.path.replaceAll(libPath.path, '_')}'.replaceAll('/', '_');
          final saveFile = File(libPath
              .resolve('../script/i18nAssets/_${result.length}$fileName.txt')
              .path);
          saveFile.createSync(recursive: true);
          saveFile.writeAsStringSync(result.join('\n'));
          result.clear();
        }
      }
      // 如果是子文件夹，递归调用函数
      else if (file is Directory) {
        findChineseStrings(file.path);
      }
    }
  } else {
    // 如果文件夹不存在，打印错误信息
    print('Folder does not exist: $folderPath');
  }
}

bool checkZh(String s) {
  // 使用正则表达式匹配双引号之间的内容
  RegExp reg = RegExp("['\"]([^\"]*)[\"']");
  // 遍历所有匹配结果
  for (var match in reg.allMatches(s)) {
    // 取出双引号之间的字
    String word = match.group(1) ?? "";
    // 判断是否有中文，使用Unicode范围
    return word.contains(RegExp(r'[\u4e00-\u9fa5]'));
  }
  return false;
}

void main(List<String> args) {
  findChineseStrings(libPath.path);
  // final file = File(libPath.resolve('../script/i18nAssets/raw.txt').path);
  // file.createSync(recursive: true);
  // file.writeAsStringSync(result.join('\n'));
}


// 提示词
/** 
你是一个dart代码专家：
/main.dart:::58:::                "页面崩溃了...",
/model/deviceInfo.dart:::91:::      "原始数据: ${bytes.hex}",
/model/deviceInfo.dart:::92:::      "硬件版本号: $hardwareVersion",
/model/deviceInfo.dart:::93:::      "蓝牙软件版本号(左耳): $bluetoothVersionLeft",
/model/deviceInfo.dart:::94:::      "蓝牙软件版本号(右耳): $bluetoothVersionRight",
/model/deviceInfo.dart:::95:::      "DSP 版本号(左耳): $dspVersionLeft",
/model/deviceInfo.dart:::96:::      "DSP 版本号(右耳): $dspVersionRight",
/model/deviceInfo.dart:::97:::      "本机 SN: ${sn.hex}",
/model/deviceInfo.dart:::98:::      "充电仓硬件版本号: $chargingBoxHardwareVersion",
/model/deviceInfo.dart:::99:::      "充电仓软件版本号: $chargingBoxSoftwareVersion",
/model/deviceInfo.dart:::100:::      "充电仓 SN: ${chargingBoxSn.hex}",
/model/deviceInfo.dart:::101:::      "电量信息(左耳): $batteryLeft",
/model/deviceInfo.dart:::102:::      "电量信息(右耳): $batteryRight",
/model/deviceInfo.dart:::103:::      "出厂的 mac 地址: ${macAddress.hex}",
/model/deviceInfo.dart:::104:::      "语言(左耳): $languageLeft",
/model/deviceInfo.dart:::105:::      "语言(右耳): $languageRight",
/model/deviceInfo.dart:::106:::      "验配结果的编号: $verificationResult",

把以上dart代码片段文本中的中文换成i18n的key（S.current.#key#），key使用大驼峰命名，并总结中文的i18n的json，英文的i18n的json，输出在代码块里。
你要输出：
1. 替换key后的原文（输出在代码块中），例如：
/main.dart:::58:::                S.current.pageCrashed
/model/deviceInfo.dart:::91:::      "${S.current.rawData}: ${bytes.hex}",
/model/deviceInfo.dart:::92:::      "${S.current.hardwareVersion}: $hardwareVersion",
2. 中文json
3. 英文json
*/