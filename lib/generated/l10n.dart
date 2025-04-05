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

  /// `Mobile No`
  String get Mobilenumber {
    return Intl.message('Mobile No', name: 'Mobilenumber', desc: '', args: []);
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

  /// `Whats App No`
  String get whatsappno {
    return Intl.message('Whats App No', name: 'whatsappno', desc: '', args: []);
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

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
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

  /// `Points :`
  String get points1 {
    return Intl.message('Points :', name: 'points1', desc: '', args: []);
  }

  /// `Verification Sucessfull`
  String get verificationsucessfull {
    return Intl.message(
      'Verification Sucessfull',
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

  /// `MY REDEEMS`
  String get myredeems {
    return Intl.message('MY REDEEMS', name: 'myredeems', desc: '', args: []);
  }

  /// `AVALIABLE POINTS`
  String get avaliablepoints {
    return Intl.message(
      'AVALIABLE POINTS',
      name: 'avaliablepoints',
      desc: '',
      args: [],
    );
  }

  /// `REDEEM POINTS`
  String get redeempoints1 {
    return Intl.message(
      'REDEEM POINTS',
      name: 'redeempoints1',
      desc: '',
      args: [],
    );
  }

  /// `EQUIVALENT AMOUNT`
  String get equivalentamount {
    return Intl.message(
      'EQUIVALENT AMOUNT',
      name: 'equivalentamount',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `REDEEM HISTORY`
  String get redeemhistory {
    return Intl.message(
      'REDEEM HISTORY',
      name: 'redeemhistory',
      desc: '',
      args: [],
    );
  }

  /// `REDEEM ON`
  String get redeemon {
    return Intl.message('REDEEM ON', name: 'redeemon', desc: '', args: []);
  }

  /// `Dealer Name`
  String get dealername {
    return Intl.message('Dealer Name', name: 'dealername', desc: '', args: []);
  }

  /// `MY POINTS`
  String get mypoints {
    return Intl.message('MY POINTS', name: 'mypoints', desc: '', args: []);
  }

  /// `Confirm Logout`
  String get confirmlogout {
    return Intl.message(
      'Confirm Logout',
      name: 'confirmlogout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get areyousureyouwanttologout {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'areyousureyouwanttologout',
      desc: '',
      args: [],
    );
  }

  /// `Scaned Points`
  String get scanedpoints {
    return Intl.message(
      'Scaned Points',
      name: 'scanedpoints',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Code :`
  String get couponcode {
    return Intl.message(
      'Coupon Code :',
      name: 'couponcode',
      desc: '',
      args: [],
    );
  }

  /// `Earned Amount :`
  String get earnedamount {
    return Intl.message(
      'Earned Amount :',
      name: 'earnedamount',
      desc: '',
      args: [],
    );
  }

  /// `Item Name :`
  String get itemname {
    return Intl.message('Item Name :', name: 'itemname', desc: '', args: []);
  }

  /// `Date of Packed :`
  String get dateofpacked {
    return Intl.message(
      'Date of Packed :',
      name: 'dateofpacked',
      desc: '',
      args: [],
    );
  }

  /// `Date of Expire :`
  String get dateofexpire {
    return Intl.message(
      'Date of Expire :',
      name: 'dateofexpire',
      desc: '',
      args: [],
    );
  }

  /// `MY TRANSACTIONS`
  String get mytransaction1 {
    return Intl.message(
      'MY TRANSACTIONS',
      name: 'mytransaction1',
      desc: '',
      args: [],
    );
  }

  /// `TRANSACTION HISTORY`
  String get transactionhistory {
    return Intl.message(
      'TRANSACTION HISTORY',
      name: 'transactionhistory',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Redemption`
  String get redemption {
    return Intl.message('Redemption', name: 'redemption', desc: '', args: []);
  }

  /// `MY DEALER PARTNER`
  String get mydealerpartner1 {
    return Intl.message(
      'MY DEALER PARTNER',
      name: 'mydealerpartner1',
      desc: '',
      args: [],
    );
  }

  /// `Search by location or dealer name`
  String get searchbylocationordealername {
    return Intl.message(
      'Search by location or dealer name',
      name: 'searchbylocationordealername',
      desc: '',
      args: [],
    );
  }

  /// `FIND DEALER`
  String get finddealer1 {
    return Intl.message('FIND DEALER', name: 'finddealer1', desc: '', args: []);
  }

  /// `Distance in`
  String get distancein {
    return Intl.message('Distance in', name: 'distancein', desc: '', args: []);
  }

  /// `Km`
  String get km {
    return Intl.message('Km', name: 'km', desc: '', args: []);
  }

  /// `Meter`
  String get meter {
    return Intl.message('Meter', name: 'meter', desc: '', args: []);
  }

  /// `Share Via WhatsApp`
  String get shareviawhatsapp {
    return Intl.message(
      'Share Via WhatsApp',
      name: 'shareviawhatsapp',
      desc: '',
      args: [],
    );
  }

  /// `For Every Referal,YOU BOTH`
  String get foreveryreferalyouboth {
    return Intl.message(
      'For Every Referal,YOU BOTH',
      name: 'foreveryreferalyouboth',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message('Copy', name: 'copy', desc: '', args: []);
  }

  /// `Refer And Get Reward`
  String get referandgetreward {
    return Intl.message(
      'Refer And Get Reward',
      name: 'referandgetreward',
      desc: '',
      args: [],
    );
  }

  /// `Chose Product`
  String get choseproduct {
    return Intl.message(
      'Chose Product',
      name: 'choseproduct',
      desc: '',
      args: [],
    );
  }

  /// `PRODUCT COMPLAINS`
  String get productcomplains1 {
    return Intl.message(
      'PRODUCT COMPLAINS',
      name: 'productcomplains1',
      desc: '',
      args: [],
    );
  }

  /// `Enter Complaint Details`
  String get entercomplaintdetails {
    return Intl.message(
      'Enter Complaint Details',
      name: 'entercomplaintdetails',
      desc: '',
      args: [],
    );
  }

  /// `Describee Your Complaints`
  String get describeyourcomplaints {
    return Intl.message(
      'Describee Your Complaints',
      name: 'describeyourcomplaints',
      desc: '',
      args: [],
    );
  }

  /// `Attach Image`
  String get attchimage {
    return Intl.message('Attach Image', name: 'attchimage', desc: '', args: []);
  }

  /// `register Complaints`
  String get registercomplaints {
    return Intl.message(
      'register Complaints',
      name: 'registercomplaints',
      desc: '',
      args: [],
    );
  }

  /// `NEW REGISTER`
  String get newregister1 {
    return Intl.message(
      'NEW REGISTER',
      name: 'newregister1',
      desc: '',
      args: [],
    );
  }

  /// `SMS`
  String get sms {
    return Intl.message('SMS', name: 'sms', desc: '', args: []);
  }

  /// `Whats App`
  String get whatsapp {
    return Intl.message('Whats App', name: 'whatsapp', desc: '', args: []);
  }

  /// `State`
  String get state {
    return Intl.message('State', name: 'state', desc: '', args: []);
  }

  /// `Select state`
  String get selectstate {
    return Intl.message(
      'Select state',
      name: 'selectstate',
      desc: '',
      args: [],
    );
  }

  /// `Email ID`
  String get emailid {
    return Intl.message('Email ID', name: 'emailid', desc: '', args: []);
  }

  /// `Uplode`
  String get uplode {
    return Intl.message('Uplode', name: 'uplode', desc: '', args: []);
  }

  /// `Selfi`
  String get selfi {
    return Intl.message('Selfi', name: 'selfi', desc: '', args: []);
  }

  /// `REGISTER`
  String get register1 {
    return Intl.message('REGISTER', name: 'register1', desc: '', args: []);
  }

  /// `Enter OTP`
  String get enterotp {
    return Intl.message('Enter OTP', name: 'enterotp', desc: '', args: []);
  }

  /// `In Valid OTP`
  String get invalidotp {
    return Intl.message('In Valid OTP', name: 'invalidotp', desc: '', args: []);
  }

  /// `Try Again`
  String get tryagain {
    return Intl.message('Try Again', name: 'tryagain', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `From Date`
  String get fromdate {
    return Intl.message('From Date', name: 'fromdate', desc: '', args: []);
  }

  /// `To Date`
  String get todate {
    return Intl.message('To Date', name: 'todate', desc: '', args: []);
  }

  /// `Search By Date`
  String get searchbydate {
    return Intl.message(
      'Search By Date',
      name: 'searchbydate',
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
