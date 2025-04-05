import 'dart:developer';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:new_one/Constant/AllRoutes.dart';
import 'package:new_one/Constant/LocalNotification.dart';
import 'package:new_one/Controller/FindDealerCtrlr.dart';
import 'package:new_one/Controller/LanguageControllers/languagecontroller.dart';
import 'package:new_one/Controller/MyDealerCtrl.dart';
import 'package:new_one/Controller/MyTransactionCtrlr.dart';
import 'package:new_one/Controller/homecontroller.dart';
import 'package:new_one/Controller/logincontrollerss/logincontroller.dart';
import 'package:new_one/Controller/redeemcontroller/remaincontroller.dart';
import 'package:new_one/Controller/scancontroller/scancontroller.dart';
import 'package:new_one/DB%20Helper/DBhelper.dart';
import 'package:new_one/Pages/login/screens/loginscreen.dart';
import 'package:new_one/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'Constant/Configuration.dart';

LocalNotificationService localNotificationService =
    new LocalNotificationService();

Configure config = Configure();
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // List<NotificationModel> notify = [];
  // final Database db = (await DBHelper.getInstance())!;
  Configure config2 = Configure();

  // if (message.notification!.android!.imageUrl != null) {
  //   notify.add(NotificationModel(
  //     docEntry: 0,
  //     titile: message.notification!.title,
  //     description: message.notification!.body!,
  //     receiveTime: config2.currentDate(),
  //     seenTime: '0',
  //     imgUrl: message.notification!.android!.imageUrl.toString(),
  //     naviScn: 'null',
  //   ));
  //   await DBOperation.insertNotification(notify, db);
  // } else {
  //   notify.add(NotificationModel(
  //     docEntry: 0,
  //     titile: message.notification!.title,
  //     description: message.notification!.body!,
  //     receiveTime: config2.currentDate(),
  //     seenTime: '0',
  //     imgUrl: 'null',
  //     naviScn: 'null',
  //   ));
  //   await DBOperation.insertNotification(notify, db);
  // }
}

final firebaseMessaging = FirebaseMessaging.instance;

getFCM() async {
  String? tokenFCM = await getTokenn();
  log("FCM tocken: ${tokenFCM!}");
}

Future<String?> getTokenn() async {
  return firebaseMessaging.getToken();
}

onReciveFCM() async {
  final Database dbs = (await DBHelper.getInstance())!;
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // List<NotificationModel> notify = [];

    // if (message.notification != null) {
    //   localNotificationService.showNitification(
    //       titile: message.notification!.title,
    //       msg: message.notification!.body,
    //       message: message);

    //   if (message.notification!.android!.imageUrl != null) {
    //     notify.add(NotificationModel(
    //       docEntry: 0, //
    //       titile: message.notification!.title,
    //       description: message.notification!.body!,
    //       receiveTime: config.currentDate(),
    //       seenTime: '0',
    //       imgUrl: message.notification!.android!.imageUrl.toString(),
    //       naviScn: 'null',
    //     ));
    //     DBOperation.insertNotification(notify, dbs);
    //   } else {
    //     notify.add(NotificationModel(
    //         docEntry: 0,
    //         //
    //         titile: message.notification!.title,
    //         description: message.notification!.body!,
    //         receiveTime: config.currentDate(),
    //         seenTime: '0',
    //         imgUrl: 'null',
    //         naviScn: 'null'));
    //     DBOperation.insertNotification(notify, dbs);
    //   }
    // }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([
  //   // DeviceOrientation.landscapeLeft,
  // ]);
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
      //     options: const FirebaseOptions(
      //   apiKey: "AIzaSyCujWq186yyiOu_X6zq3cY7bNmiMFQ4ZE0",
      //   appId: "1:47765829820:android:b81af7db39d5c9417978b9",
      //   messagingSenderId: "47765829820",
      //   projectId: "posnotify-10031",
      // )
      );
  getFCM();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await localNotificationService.flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(localNotificationService.channel);
  onReciveFCM();
  bool? isdonload = true;
  //  await SharedPref.getDatadonld();
  bool? isLog = true;
  // await SharedPref.getLoggedINSP();
  await initializeService();
  await createDB();
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

Future createDB() async {
  await DBHelper.getInstance().then((value) {
    log("Created...");
  });
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
  service.startService();
}

bool onIosBackground(ServiceInstance service) {
  WidgetsFlutterBinding.ensureInitialized();
  return true;
}

void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  //receivervb();
  timePeriod(service);
}

void timePeriod(ServiceInstance service) {
  // Timer.periodic(const Duration(seconds: 15), (timer) async {
  if (service is AndroidServiceInstance) {
    service.setForegroundNotificationInfo(
      title: "My App Service",
      content: "Updated at ${DateTime.now()}",
    );
  }

  String? device;

  service.invoke(
    'update',
    {
      "current_date": DateTime.now().toIso8601String(),
      "device": device,
    },
  );
  // });
  // receivervb();
}

class MyApp extends StatefulWidget {
  MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Languagecontroller()),
        ChangeNotifierProvider(create: (_) => LoginControllerrs()),
        ChangeNotifierProvider(create: (_) => homecontroller()),
        ChangeNotifierProvider(create: (_) => Redeemcontroller()),
        ChangeNotifierProvider(create: (_) => Scancontroller()),
        ChangeNotifierProvider(create: (_) => FindDealerController()),
        ChangeNotifierProvider(create: (_) => MyTransactionCtrl()),
        ChangeNotifierProvider(create: (_) => GetMyDealerCtrlr()),
      ],
      child: Consumer<Languagecontroller>(builder: (context, langcon, child) {
        final textTheme = Theme.of(context).textTheme;
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: langcon.locale,
            theme: ThemeData(
              // textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
              //   bodyMedium:
              //       GoogleFonts.openSans(textStyle: textTheme.bodyMedium),
              // ),
              colorScheme: ColorScheme.fromSwatch(),
              // fontFamily: GoogleFonts.openSans.toString(),
              useMaterial3: true, // Enable Material 3
            ),
            getPages: Routes.allRoutes,
            home: const Loginscreen());
      }),
    );
  }
}
