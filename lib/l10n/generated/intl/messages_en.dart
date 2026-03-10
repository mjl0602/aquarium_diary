// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(locale) => "${Intl.select(locale, {
            'zh': '简体中文',
            'en': 'English',
            'es': 'Español',
            'it': 'Italiano',
            'ja': '日本語',
            'de': 'Deutsch',
            'fr': 'France',
            'ko': '한국어',
            'other': 'AUTO',
          })}";

  static String m1(error) => "Edit Fail:${error}";

  static String m2(error) => "Register Fail:${error}";

  static String m3(sec) => "Send after ${sec}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "accountInformation":
            MessageLookupByLibrary.simpleMessage("Account Information"),
        "adjustmentProgram":
            MessageLookupByLibrary.simpleMessage("Adjustment Program"),
        "afterCompression":
            MessageLookupByLibrary.simpleMessage("Compressed size"),
        "agree": MessageLookupByLibrary.simpleMessage("Agree"),
        "agreeTerms": MessageLookupByLibrary.simpleMessage(
            "I have read and agree to the "),
        "agreeTermsFirst": MessageLookupByLibrary.simpleMessage(
            "Please agree to the terms first"),
        "allLocale": m0,
        "avatar": MessageLookupByLibrary.simpleMessage("Avatar"),
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "beforeHearingTestStarts":
            MessageLookupByLibrary.simpleMessage("Before starts"),
        "binauralFitting": MessageLookupByLibrary.simpleMessage("Start"),
        "birthday": MessageLookupByLibrary.simpleMessage("Birthday"),
        "bluetoothDisconnected":
            MessageLookupByLibrary.simpleMessage("Bluetooth Disconnected"),
        "bluetoothDisconnectedContent": MessageLookupByLibrary.simpleMessage(
            "Bluetooth disconnected, please reconnect device to restart test"),
        "bluetoothNotSupported":
            MessageLookupByLibrary.simpleMessage("Bluetooth not supported"),
        "bluetoothNotTurnedOn":
            MessageLookupByLibrary.simpleMessage("Bluetooth not turned on"),
        "bluetoothPermissionNotGranted": MessageLookupByLibrary.simpleMessage(
            "Bluetooth permission not granted"),
        "both": MessageLookupByLibrary.simpleMessage("Both"),
        "canHear": MessageLookupByLibrary.simpleMessage("Can Hear"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cannotHear": MessageLookupByLibrary.simpleMessage("Can\'t Hear"),
        "changeAvatar": MessageLookupByLibrary.simpleMessage("Change Avatar"),
        "changeFailed": m1,
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "changeSuccess": MessageLookupByLibrary.simpleMessage("Edit success"),
        "chooseFromGallery":
            MessageLookupByLibrary.simpleMessage("Choose from Gallery"),
        "clipAvatar": MessageLookupByLibrary.simpleMessage("Clip Avatar"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "code": MessageLookupByLibrary.simpleMessage("Code"),
        "codeEmptyTips": MessageLookupByLibrary.simpleMessage("Input code"),
        "commonScene": MessageLookupByLibrary.simpleMessage("General Scene"),
        "compressImage": MessageLookupByLibrary.simpleMessage("Original size"),
        "compressImageError":
            MessageLookupByLibrary.simpleMessage("Image compression failed"),
        "compressionError":
            MessageLookupByLibrary.simpleMessage("Compression Error"),
        "compressionProblem":
            MessageLookupByLibrary.simpleMessage("Compression Problem"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage("Confirm Delete"),
        "confirmExitApp": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to exit the APP?"),
        "connectDevice": MessageLookupByLibrary.simpleMessage("Connect Device"),
        "createAccount": MessageLookupByLibrary.simpleMessage("Create Account"),
        "dataReport": MessageLookupByLibrary.simpleMessage("Data Report"),
        "dataTypeError":
            MessageLookupByLibrary.simpleMessage("Data type error"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete Account"),
        "deleteAccountConfirm1": MessageLookupByLibrary.simpleMessage(
            "After deactivating account, you will not be able to login into the app again, and all records will be deleted."),
        "deleteAccountConfirm2": MessageLookupByLibrary.simpleMessage(
            "If you are sure, please enter your password below and press \"Confirm\"."),
        "deleteDevice": MessageLookupByLibrary.simpleMessage("Delete device"),
        "deleteDeviceWillAlsoDeleteData": MessageLookupByLibrary.simpleMessage(
            "Deleting the device will also delete its data, confirm to delete?"),
        "deleteIrrecoverable": MessageLookupByLibrary.simpleMessage(
            "Data cannot be recovered after deletion"),
        "deleted": MessageLookupByLibrary.simpleMessage("Deleted"),
        "demoMode": MessageLookupByLibrary.simpleMessage("Demo Mode"),
        "deviceBluetoothDisconnected": MessageLookupByLibrary.simpleMessage(
            "Device Bluetooth has been disconnected"),
        "deviceList": MessageLookupByLibrary.simpleMessage("Device List"),
        "deviceReset": MessageLookupByLibrary.simpleMessage("Device reset"),
        "disableFeaturesDuringTest": MessageLookupByLibrary.simpleMessage(
            "Hearing aid/Bluetooth audio/Bluetooth calling features will be disabled during the test"),
        "disconnectBluetooth":
            MessageLookupByLibrary.simpleMessage("Disconnect Bluetooth"),
        "disconnected": MessageLookupByLibrary.simpleMessage("Disconnect"),
        "dragChartPointToSamePosition": MessageLookupByLibrary.simpleMessage(
            "Drag the point on the chart to the same position as your hearing report"),
        "editPassword": MessageLookupByLibrary.simpleMessage("Edit Password"),
        "ensureInQuietEnvironment": MessageLookupByLibrary.simpleMessage(
            "Please ensure you are in a quiet environment"),
        "ensureQuietEnvironment": MessageLookupByLibrary.simpleMessage(
            "Please ensure you are in a quiet environment"),
        "enter": MessageLookupByLibrary.simpleMessage("Enter"),
        "enterNewNickname":
            MessageLookupByLibrary.simpleMessage("Enter New Nickname"),
        "enterPassword":
            MessageLookupByLibrary.simpleMessage("Please enter password"),
        "enterPhoneOrEmail":
            MessageLookupByLibrary.simpleMessage("Please enter phone/email"),
        "enterVerificationCode": MessageLookupByLibrary.simpleMessage(
            "Please enter verification code"),
        "exampleDevice": MessageLookupByLibrary.simpleMessage("Demo device"),
        "exit": MessageLookupByLibrary.simpleMessage("Exit"),
        "exitApp": MessageLookupByLibrary.simpleMessage("Exit APP"),
        "exitFitting": MessageLookupByLibrary.simpleMessage("Exit Fitting"),
        "exitFittingContent": MessageLookupByLibrary.simpleMessage(
            "Confirm to exit fitting? Results will not be saved"),
        "feedback": MessageLookupByLibrary.simpleMessage("Feedback"),
        "female": MessageLookupByLibrary.simpleMessage("Female"),
        "fittingResult": MessageLookupByLibrary.simpleMessage("Fitting Result"),
        "fittingResultApplied":
            MessageLookupByLibrary.simpleMessage("Fitting result applied"),
        "fittingResultSaved":
            MessageLookupByLibrary.simpleMessage("Fitting result saved"),
        "fittingResultSavedContent": MessageLookupByLibrary.simpleMessage(
            "Apply the fitting result now?"),
        "fittingResultSavedTitle":
            MessageLookupByLibrary.simpleMessage("Fitting Result Saved"),
        "fittingResultTooBigContent": MessageLookupByLibrary.simpleMessage(
            "You may have moderate to severe hearing loss. The hearing aid may produce popping sounds or feedback after fitting. Please ensure hearing safety."),
        "fittingResultTooBigTitle":
            MessageLookupByLibrary.simpleMessage("Significant Hearing Loss"),
        "fittingResultUsed":
            MessageLookupByLibrary.simpleMessage("Fitting result used"),
        "fittingTestPageTitle":
            MessageLookupByLibrary.simpleMessage("My Hearing Test"),
        "generateScheme":
            MessageLookupByLibrary.simpleMessage("Generate Scheme"),
        "getVerificationCode": MessageLookupByLibrary.simpleMessage("Get"),
        "goBack": MessageLookupByLibrary.simpleMessage("Go back"),
        "hearingFitting":
            MessageLookupByLibrary.simpleMessage("Hearing Fitting"),
        "hearingReportDescription": MessageLookupByLibrary.simpleMessage(
            "Understand your hearing level and generate a personalized hearing report"),
        "hearingTestDescription": MessageLookupByLibrary.simpleMessage(
            "Understand your hearing level\nGenerate a personalized hearing report"),
        "hearingTestInstruction": MessageLookupByLibrary.simpleMessage(
            "Press \'Can Hear\' if you hear the beep, press \'Can\'t Hear\' when inaudible"),
        "hearingTestWillTakeAbout3Minutes":
            MessageLookupByLibrary.simpleMessage(
                "The hearing test will take about 3 minutes"),
        "image": MessageLookupByLibrary.simpleMessage("Image"),
        "inUse": MessageLookupByLibrary.simpleMessage("In Use"),
        "indoorScene": MessageLookupByLibrary.simpleMessage("Indoor Scene"),
        "inputPassword": MessageLookupByLibrary.simpleMessage("Input Password"),
        "left": MessageLookupByLibrary.simpleMessage("Left"),
        "leftEar": MessageLookupByLibrary.simpleMessage("Left Ear"),
        "leftEarBattery": MessageLookupByLibrary.simpleMessage("BT-L"),
        "leftEarFitting": MessageLookupByLibrary.simpleMessage("Left Ear"),
        "leftEarHearing":
            MessageLookupByLibrary.simpleMessage("Left Ear Hearing"),
        "locationServiceNotEnabled": MessageLookupByLibrary.simpleMessage(
            "Location service not enabled"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "logoutConfirmation":
            MessageLookupByLibrary.simpleMessage("You are about to log out"),
        "male": MessageLookupByLibrary.simpleMessage("Male"),
        "manualEntry": MessageLookupByLibrary.simpleMessage("Manual Entry"),
        "modifyNickname":
            MessageLookupByLibrary.simpleMessage("Modify Nickname"),
        "modifyPassword":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "movieScene": MessageLookupByLibrary.simpleMessage("Movie Scene"),
        "myAccount": MessageLookupByLibrary.simpleMessage("My account"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "newUser": MessageLookupByLibrary.simpleMessage("New User"),
        "nicknameRequirement": MessageLookupByLibrary.simpleMessage(
            "Nickname must be 1-20 characters"),
        "noCheckUserAgreementTips": MessageLookupByLibrary.simpleMessage(
            "Please allow our terms of service"),
        "noFittingData":
            MessageLookupByLibrary.simpleMessage("No Fitting Data"),
        "noProvideUserInfo": MessageLookupByLibrary.simpleMessage(
            "Do not provide userinfo now."),
        "notConnected": MessageLookupByLibrary.simpleMessage("Not Connected"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "outdoorScene": MessageLookupByLibrary.simpleMessage("Outdoor Scene"),
        "pageCrashed": MessageLookupByLibrary.simpleMessage("Page crashed..."),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordLogin": MessageLookupByLibrary.simpleMessage("Password Login"),
        "personalInfo":
            MessageLookupByLibrary.simpleMessage("Personal Information"),
        "phoneNumberEmptyTips":
            MessageLookupByLibrary.simpleMessage("Input phone number"),
        "phoneOrMail": MessageLookupByLibrary.simpleMessage("Phone/Email"),
        "pleaseEnterContent":
            MessageLookupByLibrary.simpleMessage("Please enter content"),
        "pleaseInput": MessageLookupByLibrary.simpleMessage("Please Input"),
        "pleaseSelect": MessageLookupByLibrary.simpleMessage("Please select"),
        "prepareForTest": MessageLookupByLibrary.simpleMessage(
            "Please prepare for the test:"),
        "preparingDemoMode":
            MessageLookupByLibrary.simpleMessage("Preparing demo mode..."),
        "pressAgainToExit":
            MessageLookupByLibrary.simpleMessage("Press again to exit"),
        "previousNickname":
            MessageLookupByLibrary.simpleMessage("Previous Nickname:"),
        "programDetail":
            MessageLookupByLibrary.simpleMessage("Fitting Details"),
        "refreshUserInfo":
            MessageLookupByLibrary.simpleMessage("Refresh User Info"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "registerAccount":
            MessageLookupByLibrary.simpleMessage("Register Account"),
        "registerFailed": m2,
        "registerFirst":
            MessageLookupByLibrary.simpleMessage("Please register first"),
        "registrationTime":
            MessageLookupByLibrary.simpleMessage("Registration Time"),
        "relisten": MessageLookupByLibrary.simpleMessage("Replay"),
        "removeDeviceFromCaseAndPowerOn": MessageLookupByLibrary.simpleMessage(
            "Please remove the device from the charging case and power it on"),
        "repeat": MessageLookupByLibrary.simpleMessage("Repeat"),
        "repeatPassword":
            MessageLookupByLibrary.simpleMessage("Repeat Password"),
        "requestError": MessageLookupByLibrary.simpleMessage("Request error"),
        "resetDevice": MessageLookupByLibrary.simpleMessage("Reset Device"),
        "resetDeviceWillAlsoDeleteData": MessageLookupByLibrary.simpleMessage(
            "Reset device will reset its data, confirm to reset?"),
        "resettingDevice":
            MessageLookupByLibrary.simpleMessage("Resetting device..."),
        "right": MessageLookupByLibrary.simpleMessage("Right"),
        "rightEar": MessageLookupByLibrary.simpleMessage("Right Ear"),
        "rightEarBattery": MessageLookupByLibrary.simpleMessage("BT-R"),
        "rightEarFitting": MessageLookupByLibrary.simpleMessage("Right Ear"),
        "rightEarHearing":
            MessageLookupByLibrary.simpleMessage("Right Ear Hearing"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "saveFailed": MessageLookupByLibrary.simpleMessage("Save Failed"),
        "savePassword": MessageLookupByLibrary.simpleMessage("Save Password"),
        "saveSuccessful":
            MessageLookupByLibrary.simpleMessage("Saved Successfully"),
        "saveToAlbum": MessageLookupByLibrary.simpleMessage("Save to Album"),
        "scenarioSwitched":
            MessageLookupByLibrary.simpleMessage("Scene switched"),
        "schemeGenerated":
            MessageLookupByLibrary.simpleMessage("Program generated"),
        "sendAgain": m3,
        "sendCode": MessageLookupByLibrary.simpleMessage("Send Code"),
        "sendSuccess": MessageLookupByLibrary.simpleMessage("Send Success"),
        "sex": MessageLookupByLibrary.simpleMessage("Sex"),
        "shareImage": MessageLookupByLibrary.simpleMessage("Share Image"),
        "sharedAnImage":
            MessageLookupByLibrary.simpleMessage("Shared an Image"),
        "startHearingTest":
            MessageLookupByLibrary.simpleMessage("Start Hearing Test"),
        "switchLanguage":
            MessageLookupByLibrary.simpleMessage("Switch language"),
        "switchScenario": MessageLookupByLibrary.simpleMessage("Switch Scene"),
        "switchScene": MessageLookupByLibrary.simpleMessage("Switch Scene"),
        "takePhoto": MessageLookupByLibrary.simpleMessage("Take Photo"),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("Terms of Service"),
        "timeout": MessageLookupByLibrary.simpleMessage("Timeout"),
        "tipConnected": MessageLookupByLibrary.simpleMessage("Connected..."),
        "tipConnecting": MessageLookupByLibrary.simpleMessage("Connecting..."),
        "tipDeviceNotFound":
            MessageLookupByLibrary.simpleMessage("Device not found"),
        "tipScanning": MessageLookupByLibrary.simpleMessage("Scanning"),
        "tipSyncDone": MessageLookupByLibrary.simpleMessage("Sync Done"),
        "tipSyncing": MessageLookupByLibrary.simpleMessage("Syncing..."),
        "tipTimeout": MessageLookupByLibrary.simpleMessage("Connect Timeout"),
        "unableToShareImage":
            MessageLookupByLibrary.simpleMessage("Unable to share the image"),
        "uploadAvatar": MessageLookupByLibrary.simpleMessage("Avatar"),
        "uploadFailedPleaseRetry":
            MessageLookupByLibrary.simpleMessage("Upload failed, please retry"),
        "use": MessageLookupByLibrary.simpleMessage("Use"),
        "userAgreement":
            MessageLookupByLibrary.simpleMessage(" terms of service"),
        "userManual": MessageLookupByLibrary.simpleMessage("User Manual"),
        "userManualDescription": MessageLookupByLibrary.simpleMessage(
            "Learn how to use your hearing aid\nby reading the manual"),
        "verificationCodeLogin":
            MessageLookupByLibrary.simpleMessage("Verification Code Login"),
        "viewAvatar": MessageLookupByLibrary.simpleMessage("View Avatar"),
        "wearDeviceProperly": MessageLookupByLibrary.simpleMessage(
            "Please wear the device properly"),
        "welcomeToTangyinCompanion":
            MessageLookupByLibrary.simpleMessage("Welcome"),
        "writeWdrcFailed":
            MessageLookupByLibrary.simpleMessage("Failed to write WDRC..."),
        "writingFittingResult":
            MessageLookupByLibrary.simpleMessage("Writing fitting result...")
      };
}
