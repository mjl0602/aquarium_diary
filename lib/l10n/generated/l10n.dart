// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `{locale, select, zh {简体中文} en {English} es {Español} it {Italiano} ja {日本語} de {Deutsch} fr {France} ko {한국어} other {AUTO}}`
  String allLocale(Object locale) {
    return Intl.select(
      locale,
      {
        'zh': '简体中文',
        'en': 'English',
        'es': 'Español',
        'it': 'Italiano',
        'ja': '日本語',
        'de': 'Deutsch',
        'fr': 'France',
        'ko': '한국어',
        'other': 'AUTO',
      },
      name: 'allLocale',
      desc: '',
      args: [locale],
    );
  }

  /// `Go back`
  String get goBack {
    return Intl.message(
      'Go back',
      name: 'goBack',
      desc: '',
      args: [],
    );
  }

  /// `Disconnect`
  String get disconnected {
    return Intl.message(
      'Disconnect',
      name: 'disconnected',
      desc: '',
      args: [],
    );
  }

  /// `Device Bluetooth has been disconnected`
  String get deviceBluetoothDisconnected {
    return Intl.message(
      'Device Bluetooth has been disconnected',
      name: 'deviceBluetoothDisconnected',
      desc: '',
      args: [],
    );
  }

  /// `Please enter content`
  String get pleaseEnterContent {
    return Intl.message(
      'Please enter content',
      name: 'pleaseEnterContent',
      desc: '',
      args: [],
    );
  }

  /// `Page crashed...`
  String get pageCrashed {
    return Intl.message(
      'Page crashed...',
      name: 'pageCrashed',
      desc: '',
      args: [],
    );
  }

  /// `Press again to exit`
  String get pressAgainToExit {
    return Intl.message(
      'Press again to exit',
      name: 'pressAgainToExit',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Left`
  String get left {
    return Intl.message(
      'Left',
      name: 'left',
      desc: '',
      args: [],
    );
  }

  /// `Right`
  String get right {
    return Intl.message(
      'Right',
      name: 'right',
      desc: '',
      args: [],
    );
  }

  /// `Both`
  String get both {
    return Intl.message(
      'Both',
      name: 'both',
      desc: '',
      args: [],
    );
  }

  /// `Timeout`
  String get timeout {
    return Intl.message(
      'Timeout',
      name: 'timeout',
      desc: '',
      args: [],
    );
  }

  /// `Demo device`
  String get exampleDevice {
    return Intl.message(
      'Demo device',
      name: 'exampleDevice',
      desc: '',
      args: [],
    );
  }

  /// `My account`
  String get myAccount {
    return Intl.message(
      'My account',
      name: 'myAccount',
      desc: '',
      args: [],
    );
  }

  /// `Switch language`
  String get switchLanguage {
    return Intl.message(
      'Switch language',
      name: 'switchLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Edit success`
  String get changeSuccess {
    return Intl.message(
      'Edit success',
      name: 'changeSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Edit Fail:{error}`
  String changeFailed(Object error) {
    return Intl.message(
      'Edit Fail:$error',
      name: 'changeFailed',
      desc: '',
      args: [error],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `After deactivating account, you will not be able to login into the app again, and all records will be deleted.`
  String get deleteAccountConfirm1 {
    return Intl.message(
      'After deactivating account, you will not be able to login into the app again, and all records will be deleted.',
      name: 'deleteAccountConfirm1',
      desc: '',
      args: [],
    );
  }

  /// `If you are sure, please enter your password below and press "Confirm".`
  String get deleteAccountConfirm2 {
    return Intl.message(
      'If you are sure, please enter your password below and press "Confirm".',
      name: 'deleteAccountConfirm2',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Modify Nickname`
  String get modifyNickname {
    return Intl.message(
      'Modify Nickname',
      name: 'modifyNickname',
      desc: '',
      args: [],
    );
  }

  /// `Previous Nickname:`
  String get previousNickname {
    return Intl.message(
      'Previous Nickname:',
      name: 'previousNickname',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Nickname`
  String get enterNewNickname {
    return Intl.message(
      'Enter New Nickname',
      name: 'enterNewNickname',
      desc: '',
      args: [],
    );
  }

  /// `Nickname must be 1-20 characters`
  String get nicknameRequirement {
    return Intl.message(
      'Nickname must be 1-20 characters',
      name: 'nicknameRequirement',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedback {
    return Intl.message(
      'Feedback',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get accountInformation {
    return Intl.message(
      'Account Information',
      name: 'accountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Registration Time`
  String get registrationTime {
    return Intl.message(
      'Registration Time',
      name: 'registrationTime',
      desc: '',
      args: [],
    );
  }

  /// `Upload failed, please retry`
  String get uploadFailedPleaseRetry {
    return Intl.message(
      'Upload failed, please retry',
      name: 'uploadFailedPleaseRetry',
      desc: '',
      args: [],
    );
  }

  /// `View Avatar`
  String get viewAvatar {
    return Intl.message(
      'View Avatar',
      name: 'viewAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Change Avatar`
  String get changeAvatar {
    return Intl.message(
      'Change Avatar',
      name: 'changeAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Clip Avatar`
  String get clipAvatar {
    return Intl.message(
      'Clip Avatar',
      name: 'clipAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Compression Error`
  String get compressionError {
    return Intl.message(
      'Compression Error',
      name: 'compressionError',
      desc: '',
      args: [],
    );
  }

  /// `Compression Problem`
  String get compressionProblem {
    return Intl.message(
      'Compression Problem',
      name: 'compressionProblem',
      desc: '',
      args: [],
    );
  }

  /// `Unable to share the image`
  String get unableToShareImage {
    return Intl.message(
      'Unable to share the image',
      name: 'unableToShareImage',
      desc: '',
      args: [],
    );
  }

  /// `Share Image`
  String get shareImage {
    return Intl.message(
      'Share Image',
      name: 'shareImage',
      desc: '',
      args: [],
    );
  }

  /// `Shared an Image`
  String get sharedAnImage {
    return Intl.message(
      'Shared an Image',
      name: 'sharedAnImage',
      desc: '',
      args: [],
    );
  }

  /// `Image`
  String get image {
    return Intl.message(
      'Image',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `Saved Successfully`
  String get saveSuccessful {
    return Intl.message(
      'Saved Successfully',
      name: 'saveSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Save Failed`
  String get saveFailed {
    return Intl.message(
      'Save Failed',
      name: 'saveFailed',
      desc: '',
      args: [],
    );
  }

  /// `Save to Album`
  String get saveToAlbum {
    return Intl.message(
      'Save to Album',
      name: 'saveToAlbum',
      desc: '',
      args: [],
    );
  }

  /// `Scanning`
  String get tipScanning {
    return Intl.message(
      'Scanning',
      name: 'tipScanning',
      desc: '',
      args: [],
    );
  }

  /// `Connecting...`
  String get tipConnecting {
    return Intl.message(
      'Connecting...',
      name: 'tipConnecting',
      desc: '',
      args: [],
    );
  }

  /// `Connected...`
  String get tipConnected {
    return Intl.message(
      'Connected...',
      name: 'tipConnected',
      desc: '',
      args: [],
    );
  }

  /// `Syncing...`
  String get tipSyncing {
    return Intl.message(
      'Syncing...',
      name: 'tipSyncing',
      desc: '',
      args: [],
    );
  }

  /// `Sync Done`
  String get tipSyncDone {
    return Intl.message(
      'Sync Done',
      name: 'tipSyncDone',
      desc: '',
      args: [],
    );
  }

  /// `Connect Timeout`
  String get tipTimeout {
    return Intl.message(
      'Connect Timeout',
      name: 'tipTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Device not found`
  String get tipDeviceNotFound {
    return Intl.message(
      'Device not found',
      name: 'tipDeviceNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth not supported`
  String get bluetoothNotSupported {
    return Intl.message(
      'Bluetooth not supported',
      name: 'bluetoothNotSupported',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth permission not granted`
  String get bluetoothPermissionNotGranted {
    return Intl.message(
      'Bluetooth permission not granted',
      name: 'bluetoothPermissionNotGranted',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth not turned on`
  String get bluetoothNotTurnedOn {
    return Intl.message(
      'Bluetooth not turned on',
      name: 'bluetoothNotTurnedOn',
      desc: '',
      args: [],
    );
  }

  /// `Location service not enabled`
  String get locationServiceNotEnabled {
    return Intl.message(
      'Location service not enabled',
      name: 'locationServiceNotEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Manual Entry`
  String get manualEntry {
    return Intl.message(
      'Manual Entry',
      name: 'manualEntry',
      desc: '',
      args: [],
    );
  }

  /// `Left Ear Hearing`
  String get leftEarHearing {
    return Intl.message(
      'Left Ear Hearing',
      name: 'leftEarHearing',
      desc: '',
      args: [],
    );
  }

  /// `Right Ear Hearing`
  String get rightEarHearing {
    return Intl.message(
      'Right Ear Hearing',
      name: 'rightEarHearing',
      desc: '',
      args: [],
    );
  }

  /// `Generate Scheme`
  String get generateScheme {
    return Intl.message(
      'Generate Scheme',
      name: 'generateScheme',
      desc: '',
      args: [],
    );
  }

  /// `Input phone number`
  String get phoneNumberEmptyTips {
    return Intl.message(
      'Input phone number',
      name: 'phoneNumberEmptyTips',
      desc: '',
      args: [],
    );
  }

  /// `Send Success`
  String get sendSuccess {
    return Intl.message(
      'Send Success',
      name: 'sendSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Phone/Email`
  String get phoneOrMail {
    return Intl.message(
      'Phone/Email',
      name: 'phoneOrMail',
      desc: '',
      args: [],
    );
  }

  /// `Input code`
  String get codeEmptyTips {
    return Intl.message(
      'Input code',
      name: 'codeEmptyTips',
      desc: '',
      args: [],
    );
  }

  /// `Delete device`
  String get deleteDevice {
    return Intl.message(
      'Delete device',
      name: 'deleteDevice',
      desc: '',
      args: [],
    );
  }

  /// `Deleting the device will also delete its data, confirm to delete?`
  String get deleteDeviceWillAlsoDeleteData {
    return Intl.message(
      'Deleting the device will also delete its data, confirm to delete?',
      name: 'deleteDeviceWillAlsoDeleteData',
      desc: '',
      args: [],
    );
  }

  /// `Deleted`
  String get deleted {
    return Intl.message(
      'Deleted',
      name: 'deleted',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Repeat`
  String get repeat {
    return Intl.message(
      'Repeat',
      name: 'repeat',
      desc: '',
      args: [],
    );
  }

  /// `Input Password`
  String get inputPassword {
    return Intl.message(
      'Input Password',
      name: 'inputPassword',
      desc: '',
      args: [],
    );
  }

  /// `Repeat Password`
  String get repeatPassword {
    return Intl.message(
      'Repeat Password',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send after {sec}`
  String sendAgain(Object sec) {
    return Intl.message(
      'Send after $sec',
      name: 'sendAgain',
      desc: '',
      args: [sec],
    );
  }

  /// `Send Code`
  String get sendCode {
    return Intl.message(
      'Send Code',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Please allow our terms of service`
  String get noCheckUserAgreementTips {
    return Intl.message(
      'Please allow our terms of service',
      name: 'noCheckUserAgreementTips',
      desc: '',
      args: [],
    );
  }

  /// `New User`
  String get newUser {
    return Intl.message(
      'New User',
      name: 'newUser',
      desc: '',
      args: [],
    );
  }

  /// `Register Fail:{error}`
  String registerFailed(Object error) {
    return Intl.message(
      'Register Fail:$error',
      name: 'registerFailed',
      desc: '',
      args: [error],
    );
  }

  /// `Please Input`
  String get pleaseInput {
    return Intl.message(
      'Please Input',
      name: 'pleaseInput',
      desc: '',
      args: [],
    );
  }

  /// `Do not provide userinfo now.`
  String get noProvideUserInfo {
    return Intl.message(
      'Do not provide userinfo now.',
      name: 'noProvideUserInfo',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get agree {
    return Intl.message(
      'Agree',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// ` terms of service`
  String get userAgreement {
    return Intl.message(
      ' terms of service',
      name: 'userAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get birthday {
    return Intl.message(
      'Birthday',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `Please select`
  String get pleaseSelect {
    return Intl.message(
      'Please select',
      name: 'pleaseSelect',
      desc: '',
      args: [],
    );
  }

  /// `Sex`
  String get sex {
    return Intl.message(
      'Sex',
      name: 'sex',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Fitting Details`
  String get programDetail {
    return Intl.message(
      'Fitting Details',
      name: 'programDetail',
      desc: '',
      args: [],
    );
  }

  /// `Left Ear`
  String get leftEar {
    return Intl.message(
      'Left Ear',
      name: 'leftEar',
      desc: '',
      args: [],
    );
  }

  /// `Right Ear`
  String get rightEar {
    return Intl.message(
      'Right Ear',
      name: 'rightEar',
      desc: '',
      args: [],
    );
  }

  /// `Adjustment Program`
  String get adjustmentProgram {
    return Intl.message(
      'Adjustment Program',
      name: 'adjustmentProgram',
      desc: '',
      args: [],
    );
  }

  /// `Device List`
  String get deviceList {
    return Intl.message(
      'Device List',
      name: 'deviceList',
      desc: '',
      args: [],
    );
  }

  /// `Edit Password`
  String get editPassword {
    return Intl.message(
      'Edit Password',
      name: 'editPassword',
      desc: '',
      args: [],
    );
  }

  /// `Save Password`
  String get savePassword {
    return Intl.message(
      'Save Password',
      name: 'savePassword',
      desc: '',
      args: [],
    );
  }

  /// `Fitting Result`
  String get fittingResult {
    return Intl.message(
      'Fitting Result',
      name: 'fittingResult',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete`
  String get confirmDelete {
    return Intl.message(
      'Confirm Delete',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Data cannot be recovered after deletion`
  String get deleteIrrecoverable {
    return Intl.message(
      'Data cannot be recovered after deletion',
      name: 'deleteIrrecoverable',
      desc: '',
      args: [],
    );
  }

  /// `In Use`
  String get inUse {
    return Intl.message(
      'In Use',
      name: 'inUse',
      desc: '',
      args: [],
    );
  }

  /// `Fitting result used`
  String get fittingResultUsed {
    return Intl.message(
      'Fitting result used',
      name: 'fittingResultUsed',
      desc: '',
      args: [],
    );
  }

  /// `Writing fitting result...`
  String get writingFittingResult {
    return Intl.message(
      'Writing fitting result...',
      name: 'writingFittingResult',
      desc: '',
      args: [],
    );
  }

  /// `Use`
  String get use {
    return Intl.message(
      'Use',
      name: 'use',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Refresh User Info`
  String get refreshUserInfo {
    return Intl.message(
      'Refresh User Info',
      name: 'refreshUserInfo',
      desc: '',
      args: [],
    );
  }

  /// `Fitting result saved`
  String get fittingResultSaved {
    return Intl.message(
      'Fitting result saved',
      name: 'fittingResultSaved',
      desc: '',
      args: [],
    );
  }

  /// `Fitting Result Saved`
  String get fittingResultSavedTitle {
    return Intl.message(
      'Fitting Result Saved',
      name: 'fittingResultSavedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Apply the fitting result now?`
  String get fittingResultSavedContent {
    return Intl.message(
      'Apply the fitting result now?',
      name: 'fittingResultSavedContent',
      desc: '',
      args: [],
    );
  }

  /// `Fitting result applied`
  String get fittingResultApplied {
    return Intl.message(
      'Fitting result applied',
      name: 'fittingResultApplied',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth Disconnected`
  String get bluetoothDisconnected {
    return Intl.message(
      'Bluetooth Disconnected',
      name: 'bluetoothDisconnected',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth disconnected, please reconnect device to restart test`
  String get bluetoothDisconnectedContent {
    return Intl.message(
      'Bluetooth disconnected, please reconnect device to restart test',
      name: 'bluetoothDisconnectedContent',
      desc: '',
      args: [],
    );
  }

  /// `Exit Fitting`
  String get exitFitting {
    return Intl.message(
      'Exit Fitting',
      name: 'exitFitting',
      desc: '',
      args: [],
    );
  }

  /// `Confirm to exit fitting? Results will not be saved`
  String get exitFittingContent {
    return Intl.message(
      'Confirm to exit fitting? Results will not be saved',
      name: 'exitFittingContent',
      desc: '',
      args: [],
    );
  }

  /// `My Hearing Test`
  String get fittingTestPageTitle {
    return Intl.message(
      'My Hearing Test',
      name: 'fittingTestPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Press 'Can Hear' if you hear the beep, press 'Can't Hear' when inaudible`
  String get hearingTestInstruction {
    return Intl.message(
      'Press \'Can Hear\' if you hear the beep, press \'Can\'t Hear\' when inaudible',
      name: 'hearingTestInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Replay`
  String get relisten {
    return Intl.message(
      'Replay',
      name: 'relisten',
      desc: '',
      args: [],
    );
  }

  /// `Can't Hear`
  String get cannotHear {
    return Intl.message(
      'Can\'t Hear',
      name: 'cannotHear',
      desc: '',
      args: [],
    );
  }

  /// `Can Hear`
  String get canHear {
    return Intl.message(
      'Can Hear',
      name: 'canHear',
      desc: '',
      args: [],
    );
  }

  /// `Please register first`
  String get registerFirst {
    return Intl.message(
      'Please register first',
      name: 'registerFirst',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcomeToTangyinCompanion {
    return Intl.message(
      'Welcome',
      name: 'welcomeToTangyinCompanion',
      desc: '',
      args: [],
    );
  }

  /// `Please enter phone/email`
  String get enterPhoneOrEmail {
    return Intl.message(
      'Please enter phone/email',
      name: 'enterPhoneOrEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get enterPassword {
    return Intl.message(
      'Please enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter verification code`
  String get enterVerificationCode {
    return Intl.message(
      'Please enter verification code',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Get`
  String get getVerificationCode {
    return Intl.message(
      'Get',
      name: 'getVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Password Login`
  String get passwordLogin {
    return Intl.message(
      'Password Login',
      name: 'passwordLogin',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code Login`
  String get verificationCodeLogin {
    return Intl.message(
      'Verification Code Login',
      name: 'verificationCodeLogin',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please agree to the terms first`
  String get agreeTermsFirst {
    return Intl.message(
      'Please agree to the terms first',
      name: 'agreeTermsFirst',
      desc: '',
      args: [],
    );
  }

  /// `I have read and agree to the `
  String get agreeTerms {
    return Intl.message(
      'I have read and agree to the ',
      name: 'agreeTerms',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Exit APP`
  String get exitApp {
    return Intl.message(
      'Exit APP',
      name: 'exitApp',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exit the APP?`
  String get confirmExitApp {
    return Intl.message(
      'Are you sure you want to exit the APP?',
      name: 'confirmExitApp',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Image compression failed`
  String get compressImageError {
    return Intl.message(
      'Image compression failed',
      name: 'compressImageError',
      desc: '',
      args: [],
    );
  }

  /// `Original size`
  String get compressImage {
    return Intl.message(
      'Original size',
      name: 'compressImage',
      desc: '',
      args: [],
    );
  }

  /// `Compressed size`
  String get afterCompression {
    return Intl.message(
      'Compressed size',
      name: 'afterCompression',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get takePhoto {
    return Intl.message(
      'Take Photo',
      name: 'takePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Choose from Gallery`
  String get chooseFromGallery {
    return Intl.message(
      'Choose from Gallery',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Preparing demo mode...`
  String get preparingDemoMode {
    return Intl.message(
      'Preparing demo mode...',
      name: 'preparingDemoMode',
      desc: '',
      args: [],
    );
  }

  /// `Program generated`
  String get schemeGenerated {
    return Intl.message(
      'Program generated',
      name: 'schemeGenerated',
      desc: '',
      args: [],
    );
  }

  /// `Drag the point on the chart to the same position as your hearing report`
  String get dragChartPointToSamePosition {
    return Intl.message(
      'Drag the point on the chart to the same position as your hearing report',
      name: 'dragChartPointToSamePosition',
      desc: '',
      args: [],
    );
  }

  /// `The hearing test will take about 3 minutes`
  String get hearingTestWillTakeAbout3Minutes {
    return Intl.message(
      'The hearing test will take about 3 minutes',
      name: 'hearingTestWillTakeAbout3Minutes',
      desc: '',
      args: [],
    );
  }

  /// `Please ensure you are in a quiet environment`
  String get ensureQuietEnvironment {
    return Intl.message(
      'Please ensure you are in a quiet environment',
      name: 'ensureQuietEnvironment',
      desc: '',
      args: [],
    );
  }

  /// `Please wear the device properly`
  String get wearDeviceProperly {
    return Intl.message(
      'Please wear the device properly',
      name: 'wearDeviceProperly',
      desc: '',
      args: [],
    );
  }

  /// `Hearing aid/Bluetooth audio/Bluetooth calling features will be disabled during the test`
  String get disableFeaturesDuringTest {
    return Intl.message(
      'Hearing aid/Bluetooth audio/Bluetooth calling features will be disabled during the test',
      name: 'disableFeaturesDuringTest',
      desc: '',
      args: [],
    );
  }

  /// `Before starts`
  String get beforeHearingTestStarts {
    return Intl.message(
      'Before starts',
      name: 'beforeHearingTestStarts',
      desc: '',
      args: [],
    );
  }

  /// `Please prepare for the test:`
  String get prepareForTest {
    return Intl.message(
      'Please prepare for the test:',
      name: 'prepareForTest',
      desc: '',
      args: [],
    );
  }

  /// `Please ensure you are in a quiet environment`
  String get ensureInQuietEnvironment {
    return Intl.message(
      'Please ensure you are in a quiet environment',
      name: 'ensureInQuietEnvironment',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get binauralFitting {
    return Intl.message(
      'Start',
      name: 'binauralFitting',
      desc: '',
      args: [],
    );
  }

  /// `Left Ear`
  String get leftEarFitting {
    return Intl.message(
      'Left Ear',
      name: 'leftEarFitting',
      desc: '',
      args: [],
    );
  }

  /// `Right Ear`
  String get rightEarFitting {
    return Intl.message(
      'Right Ear',
      name: 'rightEarFitting',
      desc: '',
      args: [],
    );
  }

  /// `Switch Scene`
  String get switchScenario {
    return Intl.message(
      'Switch Scene',
      name: 'switchScenario',
      desc: '',
      args: [],
    );
  }

  /// `Scene switched`
  String get scenarioSwitched {
    return Intl.message(
      'Scene switched',
      name: 'scenarioSwitched',
      desc: '',
      args: [],
    );
  }

  /// `Failed to write WDRC...`
  String get writeWdrcFailed {
    return Intl.message(
      'Failed to write WDRC...',
      name: 'writeWdrcFailed',
      desc: '',
      args: [],
    );
  }

  /// `Request error`
  String get requestError {
    return Intl.message(
      'Request error',
      name: 'requestError',
      desc: '',
      args: [],
    );
  }

  /// `Data type error`
  String get dataTypeError {
    return Intl.message(
      'Data type error',
      name: 'dataTypeError',
      desc: '',
      args: [],
    );
  }

  /// `Avatar`
  String get avatar {
    return Intl.message(
      'Avatar',
      name: 'avatar',
      desc: '',
      args: [],
    );
  }

  /// `Avatar`
  String get uploadAvatar {
    return Intl.message(
      'Avatar',
      name: 'uploadAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get modifyPassword {
    return Intl.message(
      'Change Password',
      name: 'modifyPassword',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInfo {
    return Intl.message(
      'Personal Information',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Register Account`
  String get registerAccount {
    return Intl.message(
      'Register Account',
      name: 'registerAccount',
      desc: '',
      args: [],
    );
  }

  /// `You are about to log out`
  String get logoutConfirmation {
    return Intl.message(
      'You are about to log out',
      name: 'logoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `General Scene`
  String get commonScene {
    return Intl.message(
      'General Scene',
      name: 'commonScene',
      desc: '',
      args: [],
    );
  }

  /// `Outdoor Scene`
  String get outdoorScene {
    return Intl.message(
      'Outdoor Scene',
      name: 'outdoorScene',
      desc: '',
      args: [],
    );
  }

  /// `Indoor Scene`
  String get indoorScene {
    return Intl.message(
      'Indoor Scene',
      name: 'indoorScene',
      desc: '',
      args: [],
    );
  }

  /// `Movie Scene`
  String get movieScene {
    return Intl.message(
      'Movie Scene',
      name: 'movieScene',
      desc: '',
      args: [],
    );
  }

  /// `No Fitting Data`
  String get noFittingData {
    return Intl.message(
      'No Fitting Data',
      name: 'noFittingData',
      desc: '',
      args: [],
    );
  }

  /// `Please remove the device from the charging case and power it on`
  String get removeDeviceFromCaseAndPowerOn {
    return Intl.message(
      'Please remove the device from the charging case and power it on',
      name: 'removeDeviceFromCaseAndPowerOn',
      desc: '',
      args: [],
    );
  }

  /// `Connect Device`
  String get connectDevice {
    return Intl.message(
      'Connect Device',
      name: 'connectDevice',
      desc: '',
      args: [],
    );
  }

  /// `Demo Mode`
  String get demoMode {
    return Intl.message(
      'Demo Mode',
      name: 'demoMode',
      desc: '',
      args: [],
    );
  }

  /// `Not Connected`
  String get notConnected {
    return Intl.message(
      'Not Connected',
      name: 'notConnected',
      desc: '',
      args: [],
    );
  }

  /// `Data Report`
  String get dataReport {
    return Intl.message(
      'Data Report',
      name: 'dataReport',
      desc: '',
      args: [],
    );
  }

  /// `Switch Scene`
  String get switchScene {
    return Intl.message(
      'Switch Scene',
      name: 'switchScene',
      desc: '',
      args: [],
    );
  }

  /// `Hearing Fitting`
  String get hearingFitting {
    return Intl.message(
      'Hearing Fitting',
      name: 'hearingFitting',
      desc: '',
      args: [],
    );
  }

  /// `Understand your hearing level and generate a personalized hearing report`
  String get hearingReportDescription {
    return Intl.message(
      'Understand your hearing level and generate a personalized hearing report',
      name: 'hearingReportDescription',
      desc: '',
      args: [],
    );
  }

  /// `Start Hearing Test`
  String get startHearingTest {
    return Intl.message(
      'Start Hearing Test',
      name: 'startHearingTest',
      desc: '',
      args: [],
    );
  }

  /// `BT-L`
  String get leftEarBattery {
    return Intl.message(
      'BT-L',
      name: 'leftEarBattery',
      desc: '',
      args: [],
    );
  }

  /// `BT-R`
  String get rightEarBattery {
    return Intl.message(
      'BT-R',
      name: 'rightEarBattery',
      desc: '',
      args: [],
    );
  }

  /// `User Manual`
  String get userManual {
    return Intl.message(
      'User Manual',
      name: 'userManual',
      desc: '',
      args: [],
    );
  }

  /// `Understand your hearing level\nGenerate a personalized hearing report`
  String get hearingTestDescription {
    return Intl.message(
      'Understand your hearing level\nGenerate a personalized hearing report',
      name: 'hearingTestDescription',
      desc: '',
      args: [],
    );
  }

  /// `Learn how to use your hearing aid\nby reading the manual`
  String get userManualDescription {
    return Intl.message(
      'Learn how to use your hearing aid\nby reading the manual',
      name: 'userManualDescription',
      desc: '',
      args: [],
    );
  }

  /// `Reset device will reset its data, confirm to reset?`
  String get resetDeviceWillAlsoDeleteData {
    return Intl.message(
      'Reset device will reset its data, confirm to reset?',
      name: 'resetDeviceWillAlsoDeleteData',
      desc: '',
      args: [],
    );
  }

  /// `Resetting device...`
  String get resettingDevice {
    return Intl.message(
      'Resetting device...',
      name: 'resettingDevice',
      desc: '',
      args: [],
    );
  }

  /// `Device reset`
  String get deviceReset {
    return Intl.message(
      'Device reset',
      name: 'deviceReset',
      desc: '',
      args: [],
    );
  }

  /// `Reset Device`
  String get resetDevice {
    return Intl.message(
      'Reset Device',
      name: 'resetDevice',
      desc: '',
      args: [],
    );
  }

  /// `Disconnect Bluetooth`
  String get disconnectBluetooth {
    return Intl.message(
      'Disconnect Bluetooth',
      name: 'disconnectBluetooth',
      desc: '',
      args: [],
    );
  }

  /// `Significant Hearing Loss`
  String get fittingResultTooBigTitle {
    return Intl.message(
      'Significant Hearing Loss',
      name: 'fittingResultTooBigTitle',
      desc: '',
      args: [],
    );
  }

  /// `You may have moderate to severe hearing loss. The hearing aid may produce popping sounds or feedback after fitting. Please ensure hearing safety.`
  String get fittingResultTooBigContent {
    return Intl.message(
      'You may have moderate to severe hearing loss. The hearing aid may produce popping sounds or feedback after fitting. Please ensure hearing safety.',
      name: 'fittingResultTooBigContent',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
