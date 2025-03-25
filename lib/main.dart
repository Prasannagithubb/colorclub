import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:new_one/Constant/AllRoutes.dart';
import 'package:new_one/Controller/homecontroller.dart';
import 'package:new_one/Controller/logincontroller/languagecontroller.dart';
import 'package:new_one/Controller/logincontroller/logincontroller.dart';
import 'package:new_one/Controller/redeemcontroller/remaincontroller.dart';
import 'package:new_one/Controller/scancontroller/scancontroller.dart';
import 'package:new_one/Pages/login/screens/loginscreen.dart';
import 'package:new_one/generated/l10n.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Languagecontroller()..init())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginController(context)),
        ChangeNotifierProvider(create: (_) => homecontroller()),
        ChangeNotifierProvider(create: (_) => Redeemcontroller()),
        ChangeNotifierProvider(create: (_) => Scancontroller()),
      ],
      child: Consumer<Languagecontroller>(builder: (context, langcon, child) {
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
            colorScheme: ColorScheme.fromSwatch(
                // primarySwatch:
                //     createMaterialColor(const Color.fromARGB(255, 1, 143, 154)),
                ),
            useMaterial3: true, // Enable Material 3
          ),
          getPages: Routes.allRoutes,
          home: const Loginscreen(),
        );
      }),
    );
  }
}
