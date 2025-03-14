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

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
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
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hi'),
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
