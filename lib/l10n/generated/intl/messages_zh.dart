// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  static String m0(locale) => "${Intl.select(locale, {
            'zh': '简体中文',
            'en': 'English',
            'es': 'Español',
            'it': 'Italiano',
            'ja': '日本語',
            'de': 'Deutsch',
            'fr': 'France',
            'ko': '한국어',
            'other': '跟随系统',
          })}";

  static String m1(error) => "修改失败:${error}";

  static String m2(error) => "注册错误:${error}";

  static String m3(sec) => "${sec}秒后重新发送";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("账户"),
        "accountInformation": MessageLookupByLibrary.simpleMessage("账号信息"),
        "adjustmentProgram": MessageLookupByLibrary.simpleMessage("调整方案"),
        "afterCompression": MessageLookupByLibrary.simpleMessage("压缩后"),
        "agree": MessageLookupByLibrary.simpleMessage("同意"),
        "agreeTerms": MessageLookupByLibrary.simpleMessage("我已阅读并同意"),
        "agreeTermsFirst": MessageLookupByLibrary.simpleMessage("请先同意服务条款"),
        "allLocale": m0,
        "avatar": MessageLookupByLibrary.simpleMessage("头像"),
        "back": MessageLookupByLibrary.simpleMessage("返回"),
        "beforeHearingTestStarts":
            MessageLookupByLibrary.simpleMessage("听力测试开始前"),
        "binauralFitting": MessageLookupByLibrary.simpleMessage("双耳验配"),
        "birthday": MessageLookupByLibrary.simpleMessage("生日"),
        "bluetoothDisconnected": MessageLookupByLibrary.simpleMessage("蓝牙已断开"),
        "bluetoothDisconnectedContent":
            MessageLookupByLibrary.simpleMessage("蓝牙已断开，请连接设备后重新开始测试"),
        "bluetoothNotSupported": MessageLookupByLibrary.simpleMessage("不支持蓝牙"),
        "bluetoothNotTurnedOn": MessageLookupByLibrary.simpleMessage("未开启蓝牙"),
        "bluetoothPermissionNotGranted":
            MessageLookupByLibrary.simpleMessage("未获取蓝牙权限"),
        "both": MessageLookupByLibrary.simpleMessage("双耳"),
        "canHear": MessageLookupByLibrary.simpleMessage("听得见"),
        "cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "cannotHear": MessageLookupByLibrary.simpleMessage("听不见"),
        "changeAvatar": MessageLookupByLibrary.simpleMessage("更换头像"),
        "changeFailed": m1,
        "changePassword": MessageLookupByLibrary.simpleMessage("修改密码"),
        "changeSuccess": MessageLookupByLibrary.simpleMessage("修改成功"),
        "chooseFromGallery": MessageLookupByLibrary.simpleMessage("从手机相册选择"),
        "clipAvatar": MessageLookupByLibrary.simpleMessage("裁剪头像"),
        "close": MessageLookupByLibrary.simpleMessage("关闭"),
        "code": MessageLookupByLibrary.simpleMessage("验证码"),
        "codeEmptyTips": MessageLookupByLibrary.simpleMessage("请填写验证码"),
        "commonScene": MessageLookupByLibrary.simpleMessage("通用场景"),
        "compressImage": MessageLookupByLibrary.simpleMessage("压缩图片"),
        "compressImageError": MessageLookupByLibrary.simpleMessage("压缩图片出错"),
        "compressionError": MessageLookupByLibrary.simpleMessage("压缩出错"),
        "compressionProblem": MessageLookupByLibrary.simpleMessage("压缩出现问题"),
        "confirm": MessageLookupByLibrary.simpleMessage("确认"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage("确认删除"),
        "confirmExitApp": MessageLookupByLibrary.simpleMessage("确认要退出APP吗?"),
        "connectDevice": MessageLookupByLibrary.simpleMessage("连接设备"),
        "createAccount": MessageLookupByLibrary.simpleMessage("创建账户"),
        "dataReport": MessageLookupByLibrary.simpleMessage("数据报告"),
        "dataTypeError": MessageLookupByLibrary.simpleMessage("数据类型错误"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("删除账户"),
        "deleteAccountConfirm1": MessageLookupByLibrary.simpleMessage(
            "删除帐户后，您的一切资料都将被移除，且无法再使用此帐户登录。"),
        "deleteAccountConfirm2": MessageLookupByLibrary.simpleMessage(
            "您的一切资料都将从本机与服务器中被删除。如果您确定删除当前帐户内的所有信息，请点击下方的“确认”。"),
        "deleteDevice": MessageLookupByLibrary.simpleMessage("删除设备"),
        "deleteDeviceWillAlsoDeleteData":
            MessageLookupByLibrary.simpleMessage("删除设备将会同时删除数据，确认要删除设备吗"),
        "deleteIrrecoverable":
            MessageLookupByLibrary.simpleMessage("数据删除后无法恢复"),
        "deleted": MessageLookupByLibrary.simpleMessage("已删除"),
        "demoMode": MessageLookupByLibrary.simpleMessage("演示模式"),
        "deviceBluetoothDisconnected":
            MessageLookupByLibrary.simpleMessage("设备蓝牙已断开"),
        "deviceList": MessageLookupByLibrary.simpleMessage("设备列表"),
        "deviceReset": MessageLookupByLibrary.simpleMessage("设备已恢复出厂设置"),
        "disableFeaturesDuringTest":
            MessageLookupByLibrary.simpleMessage("测试中将关闭 助听/蓝牙音频/蓝牙通话 功能"),
        "disconnectBluetooth": MessageLookupByLibrary.simpleMessage("断开蓝牙"),
        "disconnected": MessageLookupByLibrary.simpleMessage("未连接"),
        "dragChartPointToSamePosition":
            MessageLookupByLibrary.simpleMessage("拖动图表上的点到您的听力报告的相同位置"),
        "editPassword": MessageLookupByLibrary.simpleMessage("修改密码"),
        "ensureInQuietEnvironment":
            MessageLookupByLibrary.simpleMessage("请确保您处于安静的环境"),
        "ensureQuietEnvironment":
            MessageLookupByLibrary.simpleMessage("请确保您处于安静环境"),
        "enter": MessageLookupByLibrary.simpleMessage("录入"),
        "enterNewNickname": MessageLookupByLibrary.simpleMessage("输入新的昵称"),
        "enterPassword": MessageLookupByLibrary.simpleMessage("请输入密码"),
        "enterPhoneOrEmail": MessageLookupByLibrary.simpleMessage("请输入电话/邮箱"),
        "enterVerificationCode": MessageLookupByLibrary.simpleMessage("请输入验证码"),
        "exampleDevice": MessageLookupByLibrary.simpleMessage("演示设备"),
        "exit": MessageLookupByLibrary.simpleMessage("退出"),
        "exitApp": MessageLookupByLibrary.simpleMessage("退出APP"),
        "exitFitting": MessageLookupByLibrary.simpleMessage("离开验配"),
        "exitFittingContent":
            MessageLookupByLibrary.simpleMessage("确认要离开验配吗？结果将不会保存"),
        "feedback": MessageLookupByLibrary.simpleMessage("评价/反馈"),
        "female": MessageLookupByLibrary.simpleMessage("女"),
        "fittingResult": MessageLookupByLibrary.simpleMessage("验配结果"),
        "fittingResultApplied": MessageLookupByLibrary.simpleMessage("验配结果已使用"),
        "fittingResultSaved": MessageLookupByLibrary.simpleMessage("验配结果已保存"),
        "fittingResultSavedContent":
            MessageLookupByLibrary.simpleMessage("要立刻应用验配结果吗？"),
        "fittingResultSavedTitle":
            MessageLookupByLibrary.simpleMessage("已保存验配结果"),
        "fittingResultTooBigContent": MessageLookupByLibrary.simpleMessage(
            "您当前可能为中重度听损，应用方案后，助听器可能产生爆破音或者啸叫，请注意听力安全"),
        "fittingResultTooBigTitle":
            MessageLookupByLibrary.simpleMessage("听力损失较大"),
        "fittingResultUsed": MessageLookupByLibrary.simpleMessage("验配结果已使用"),
        "fittingTestPageTitle": MessageLookupByLibrary.simpleMessage("我的听力测试"),
        "generateScheme": MessageLookupByLibrary.simpleMessage("生成方案"),
        "getVerificationCode": MessageLookupByLibrary.simpleMessage("获取"),
        "goBack": MessageLookupByLibrary.simpleMessage("返回"),
        "hearingFitting": MessageLookupByLibrary.simpleMessage("听力验配"),
        "hearingReportDescription":
            MessageLookupByLibrary.simpleMessage("了解您的听力水平，生成一份您的专属听力报告"),
        "hearingTestDescription":
            MessageLookupByLibrary.simpleMessage("了解您的听力水平\n生成一份您的专属听力报告"),
        "hearingTestInstruction": MessageLookupByLibrary.simpleMessage(
            "如果您能听见嘟嘟声，请按“听得见”；听不见时，请按“听不见”"),
        "hearingTestWillTakeAbout3Minutes":
            MessageLookupByLibrary.simpleMessage("听力测试将需要大约3分钟"),
        "image": MessageLookupByLibrary.simpleMessage("图片"),
        "inUse": MessageLookupByLibrary.simpleMessage("使用中"),
        "indoorScene": MessageLookupByLibrary.simpleMessage("室内场景"),
        "inputPassword": MessageLookupByLibrary.simpleMessage("输入密码"),
        "left": MessageLookupByLibrary.simpleMessage("左耳"),
        "leftEar": MessageLookupByLibrary.simpleMessage("左耳"),
        "leftEarBattery": MessageLookupByLibrary.simpleMessage("左耳电量"),
        "leftEarFitting": MessageLookupByLibrary.simpleMessage("左耳验配"),
        "leftEarHearing": MessageLookupByLibrary.simpleMessage("左耳听力"),
        "locationServiceNotEnabled":
            MessageLookupByLibrary.simpleMessage("未开启定位服务"),
        "login": MessageLookupByLibrary.simpleMessage("登录"),
        "logout": MessageLookupByLibrary.simpleMessage("退出"),
        "logoutConfirmation": MessageLookupByLibrary.simpleMessage("你将要退出登录"),
        "male": MessageLookupByLibrary.simpleMessage("男"),
        "manualEntry": MessageLookupByLibrary.simpleMessage("手动录入"),
        "modifyNickname": MessageLookupByLibrary.simpleMessage("修改昵称"),
        "modifyPassword": MessageLookupByLibrary.simpleMessage("修改密码"),
        "movieScene": MessageLookupByLibrary.simpleMessage("观影场景"),
        "myAccount": MessageLookupByLibrary.simpleMessage("我的帐户"),
        "name": MessageLookupByLibrary.simpleMessage("姓名"),
        "newUser": MessageLookupByLibrary.simpleMessage("新用户"),
        "nicknameRequirement":
            MessageLookupByLibrary.simpleMessage("昵称须为1-20字"),
        "noCheckUserAgreementTips":
            MessageLookupByLibrary.simpleMessage("请阅读并同意用户协议"),
        "noFittingData": MessageLookupByLibrary.simpleMessage("无验配数据"),
        "noProvideUserInfo": MessageLookupByLibrary.simpleMessage("暂不提供个人信息"),
        "notConnected": MessageLookupByLibrary.simpleMessage("未连接"),
        "ok": MessageLookupByLibrary.simpleMessage("确认"),
        "outdoorScene": MessageLookupByLibrary.simpleMessage("户外场景"),
        "pageCrashed": MessageLookupByLibrary.simpleMessage("页面崩溃了..."),
        "password": MessageLookupByLibrary.simpleMessage("密码"),
        "passwordLogin": MessageLookupByLibrary.simpleMessage("密码登录"),
        "personalInfo": MessageLookupByLibrary.simpleMessage("个人信息"),
        "phoneNumberEmptyTips": MessageLookupByLibrary.simpleMessage("请填写手机号"),
        "phoneOrMail": MessageLookupByLibrary.simpleMessage("电话/邮箱"),
        "pleaseEnterContent": MessageLookupByLibrary.simpleMessage("请填写内容"),
        "pleaseInput": MessageLookupByLibrary.simpleMessage("请输入"),
        "pleaseSelect": MessageLookupByLibrary.simpleMessage("请选择"),
        "prepareForTest": MessageLookupByLibrary.simpleMessage("请做好测试准备:"),
        "preparingDemoMode": MessageLookupByLibrary.simpleMessage("正在准备演示模式……"),
        "pressAgainToExit": MessageLookupByLibrary.simpleMessage("再按一次退出"),
        "previousNickname": MessageLookupByLibrary.simpleMessage("之前的昵称:"),
        "programDetail": MessageLookupByLibrary.simpleMessage("验配详情"),
        "refreshUserInfo": MessageLookupByLibrary.simpleMessage("刷新用户信息"),
        "register": MessageLookupByLibrary.simpleMessage("注册"),
        "registerAccount": MessageLookupByLibrary.simpleMessage("注册账户"),
        "registerFailed": m2,
        "registerFirst": MessageLookupByLibrary.simpleMessage("请先注册"),
        "registrationTime": MessageLookupByLibrary.simpleMessage("注册时间"),
        "relisten": MessageLookupByLibrary.simpleMessage("重听"),
        "removeDeviceFromCaseAndPowerOn":
            MessageLookupByLibrary.simpleMessage("请将设备从充电盒中拿出并开机"),
        "repeat": MessageLookupByLibrary.simpleMessage("重复密码"),
        "repeatPassword": MessageLookupByLibrary.simpleMessage("重复密码"),
        "requestError": MessageLookupByLibrary.simpleMessage("请求错误"),
        "resetDevice": MessageLookupByLibrary.simpleMessage("恢复出厂设置"),
        "resetDeviceWillAlsoDeleteData":
            MessageLookupByLibrary.simpleMessage("恢复出厂设置将会同时重置数据，确认要恢复出厂设置吗"),
        "resettingDevice": MessageLookupByLibrary.simpleMessage("正在恢复出厂设置..."),
        "right": MessageLookupByLibrary.simpleMessage("右耳"),
        "rightEar": MessageLookupByLibrary.simpleMessage("右耳"),
        "rightEarBattery": MessageLookupByLibrary.simpleMessage("右耳电量"),
        "rightEarFitting": MessageLookupByLibrary.simpleMessage("右耳验配"),
        "rightEarHearing": MessageLookupByLibrary.simpleMessage("右耳听力"),
        "save": MessageLookupByLibrary.simpleMessage("保存"),
        "saveFailed": MessageLookupByLibrary.simpleMessage("保存失败"),
        "savePassword": MessageLookupByLibrary.simpleMessage("保存密码"),
        "saveSuccessful": MessageLookupByLibrary.simpleMessage("保存成功"),
        "saveToAlbum": MessageLookupByLibrary.simpleMessage("保存到相册"),
        "scenarioSwitched": MessageLookupByLibrary.simpleMessage("场景已切换"),
        "schemeGenerated": MessageLookupByLibrary.simpleMessage("方案已生成"),
        "sendAgain": m3,
        "sendCode": MessageLookupByLibrary.simpleMessage("发送验证码"),
        "sendSuccess": MessageLookupByLibrary.simpleMessage("发送成功"),
        "sex": MessageLookupByLibrary.simpleMessage("性别"),
        "shareImage": MessageLookupByLibrary.simpleMessage("分享图片"),
        "sharedAnImage": MessageLookupByLibrary.simpleMessage("分享了一张图片"),
        "startHearingTest": MessageLookupByLibrary.simpleMessage("开始听力测试"),
        "switchLanguage": MessageLookupByLibrary.simpleMessage("切换语言"),
        "switchScenario": MessageLookupByLibrary.simpleMessage("换场景"),
        "switchScene": MessageLookupByLibrary.simpleMessage("换场景"),
        "takePhoto": MessageLookupByLibrary.simpleMessage("拍照"),
        "termsOfService": MessageLookupByLibrary.simpleMessage("《服务条款》"),
        "timeout": MessageLookupByLibrary.simpleMessage("超时"),
        "tipConnected": MessageLookupByLibrary.simpleMessage("已连接..."),
        "tipConnecting": MessageLookupByLibrary.simpleMessage("正在连接..."),
        "tipDeviceNotFound": MessageLookupByLibrary.simpleMessage("未找到设备"),
        "tipScanning": MessageLookupByLibrary.simpleMessage("正在扫描"),
        "tipSyncDone": MessageLookupByLibrary.simpleMessage("同步完成"),
        "tipSyncing": MessageLookupByLibrary.simpleMessage("同步中..."),
        "tipTimeout": MessageLookupByLibrary.simpleMessage("连接超时"),
        "unableToShareImage": MessageLookupByLibrary.simpleMessage("无法分享该图片"),
        "uploadAvatar": MessageLookupByLibrary.simpleMessage("上传头像"),
        "uploadFailedPleaseRetry":
            MessageLookupByLibrary.simpleMessage("上传失败，请重试"),
        "use": MessageLookupByLibrary.simpleMessage("使用"),
        "userAgreement": MessageLookupByLibrary.simpleMessage(" 用户协议"),
        "userManual": MessageLookupByLibrary.simpleMessage("使用说明"),
        "userManualDescription":
            MessageLookupByLibrary.simpleMessage("通过阅读说明书\n学习如何使用您的助听器"),
        "verificationCodeLogin": MessageLookupByLibrary.simpleMessage("验证码登录"),
        "viewAvatar": MessageLookupByLibrary.simpleMessage("查看头像"),
        "wearDeviceProperly": MessageLookupByLibrary.simpleMessage("请正确佩戴设备"),
        "welcomeToTangyinCompanion":
            MessageLookupByLibrary.simpleMessage("欢迎使用堂音伴侣"),
        "writeWdrcFailed": MessageLookupByLibrary.simpleMessage("写入WDRC失败..."),
        "writingFittingResult":
            MessageLookupByLibrary.simpleMessage("正在写入验配结果...")
      };
}
