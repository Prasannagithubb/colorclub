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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Mobile number`
  String get Mobilenumber {
    return Intl.message(
      'Mobile number',
      name: 'Mobilenumber',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get Sendotp {
    return Intl.message('Send OTP', name: 'Sendotp', desc: '', args: []);
  }

  /// `New Register`
  String get newregister {
    return Intl.message(
      'New Register',
      name: 'newregister',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get otpverify {
    return Intl.message(
      'OTP Verification',
      name: 'otpverify',
      desc: '',
      args: [],
    );
  }

  /// `Enter the OTP sent to your phone`
  String get otpenter {
    return Intl.message(
      'Enter the OTP sent to your phone',
      name: 'otpenter',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Didn't receive code?`
  String get didntrecivecode {
    return Intl.message(
      'Didn\'t receive code?',
      name: 'didntrecivecode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `User Name`
  String get username {
    return Intl.message('User Name', name: 'username', desc: '', args: []);
  }

  /// `Whats App Number`
  String get whatsappno {
    return Intl.message(
      'Whats App Number',
      name: 'whatsappno',
      desc: '',
      args: [],
    );
  }

  /// `Notification Via`
  String get notificationvia {
    return Intl.message(
      'Notification Via',
      name: 'notificationvia',
      desc: '',
      args: [],
    );
  }

  /// `Address 1`
  String get address1 {
    return Intl.message('Address 1', name: 'address1', desc: '', args: []);
  }

  /// `Via Google`
  String get viagoogle {
    return Intl.message('Via Google', name: 'viagoogle', desc: '', args: []);
  }

  /// `Address 2`
  String get address2 {
    return Intl.message('Address 2', name: 'address2', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Country`
  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  /// `Zip Code`
  String get zipcode {
    return Intl.message('Zip Code', name: 'zipcode', desc: '', args: []);
  }

  /// `Redeem`
  String get redeem {
    return Intl.message('Redeem', name: 'redeem', desc: '', args: []);
  }

  /// `Rewards`
  String get rewards {
    return Intl.message('Rewards', name: 'rewards', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Points`
  String get points {
    return Intl.message('Points', name: 'points', desc: '', args: []);
  }

  /// `Verification Sucessfull!`
  String get verificationsucessfull {
    return Intl.message(
      'Verification Sucessfull!',
      name: 'verificationsucessfull',
      desc: '',
      args: [],
    );
  }

  /// `Scan Coupon`
  String get scancoupon {
    return Intl.message('Scan Coupon', name: 'scancoupon', desc: '', args: []);
  }

  /// `Redeem points`
  String get redeempoints {
    return Intl.message(
      'Redeem points',
      name: 'redeempoints',
      desc: '',
      args: [],
    );
  }

  /// `My Transactions`
  String get mytransactions {
    return Intl.message(
      'My Transactions',
      name: 'mytransactions',
      desc: '',
      args: [],
    );
  }

  /// `My Dealer Partner`
  String get mydealerpartner {
    return Intl.message(
      'My Dealer Partner',
      name: 'mydealerpartner',
      desc: '',
      args: [],
    );
  }

  /// `Find Dealer`
  String get finddealer {
    return Intl.message('Find Dealer', name: 'finddealer', desc: '', args: []);
  }

  /// `Find Product`
  String get findproduct {
    return Intl.message(
      'Find Product',
      name: 'findproduct',
      desc: '',
      args: [],
    );
  }

  /// `Refer Customer`
  String get refercustomer {
    return Intl.message(
      'Refer Customer',
      name: 'refercustomer',
      desc: '',
      args: [],
    );
  }

  /// `Product Complaints`
  String get ProductComplaints {
    return Intl.message(
      'Product Complaints',
      name: 'ProductComplaints',
      desc: '',
      args: [],
    );
  }

  /// `Your OTP has been verified sucessfully`
  String get yourotphasverifiedsucessfully {
    return Intl.message(
      'Your OTP has been verified sucessfully',
      name: 'yourotphasverifiedsucessfully',
      desc: '',
      args: [],
    );
  }

  /// `KYC`
  String get kyc {
    return Intl.message('KYC', name: 'kyc', desc: '', args: []);
  }

  /// `Continue`
  String get continue1 {
    return Intl.message('Continue', name: 'continue1', desc: '', args: []);
  }

  /// `Welcome to`
  String get welcometo {
    return Intl.message('Welcome to', name: 'welcometo', desc: '', args: []);
  }

  /// `Earn Points For Every Dollar Spent`
  String get earnpointsforeverydollarspent {
    return Intl.message(
      'Earn Points For Every Dollar Spent',
      name: 'earnpointsforeverydollarspent',
      desc: '',
      args: [],
    );
  }

  /// `150 Points`
  String get pointsaa {
    return Intl.message('150 Points', name: 'pointsaa', desc: '', args: []);
  }

  /// `$10 reward`
  String get rewardaa {
    return Intl.message('\$10 reward', name: 'rewardaa', desc: '', args: []);
  }

  /// `reward Balance`
  String get rewardbalance {
    return Intl.message(
      'reward Balance',
      name: 'rewardbalance',
      desc: '',
      args: [],
    );
  }

  /// `Get Points`
  String get getpoints {
    return Intl.message('Get Points', name: 'getpoints', desc: '', args: []);
  }

  /// `Redeem Amount`
  String get redeemamount {
    return Intl.message(
      'Redeem Amount',
      name: 'redeemamount',
      desc: '',
      args: [],
    );
  }

  /// `Badge Level`
  String get badgelevel {
    return Intl.message('Badge Level', name: 'badgelevel', desc: '', args: []);
  }

  /// `Dealer`
  String get dealer {
    return Intl.message('Dealer', name: 'dealer', desc: '', args: []);
  }

  /// `Earn Points History`
  String get earnpointshistory {
    return Intl.message(
      'Earn Points History',
      name: 'earnpointshistory',
      desc: '',
      args: [],
    );
  }

  /// `Track All Points`
  String get trackallpoints {
    return Intl.message(
      'Track All Points',
      name: 'trackallpoints',
      desc: '',
      args: [],
    );
  }

  /// `points To Cash Or Paints`
  String get pointstocashorpaints {
    return Intl.message(
      'points To Cash Or Paints',
      name: 'pointstocashorpaints',
      desc: '',
      args: [],
    );
  }

  /// `Redeem To White Goods`
  String get redeemtowhitegoods {
    return Intl.message(
      'Redeem To White Goods',
      name: 'redeemtowhitegoods',
      desc: '',
      args: [],
    );
  }

  /// `Redeem Points History`
  String get redeempointshistory {
    return Intl.message(
      'Redeem Points History',
      name: 'redeempointshistory',
      desc: '',
      args: [],
    );
  }

  /// `Benifit Of All Tier`
  String get benifitofalltier {
    return Intl.message(
      'Benifit Of All Tier',
      name: 'benifitofalltier',
      desc: '',
      args: [],
    );
  }

  /// `View Benifits`
  String get viewbenifits {
    return Intl.message(
      'View Benifits',
      name: 'viewbenifits',
      desc: '',
      args: [],
    );
  }

  /// `user Points`
  String get userpoints {
    return Intl.message('user Points', name: 'userpoints', desc: '', args: []);
  }

  /// `Scanned QR Code`
  String get scaneedqrcode {
    return Intl.message(
      'Scanned QR Code',
      name: 'scaneedqrcode',
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
      Locale.fromSubtags(languageCode: 'sw'),
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
