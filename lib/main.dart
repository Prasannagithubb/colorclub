import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_one/Controller/logincontroller/languagecontroller.dart';
import 'package:new_one/Controller/logincontroller/logincontroller.dart';
import 'package:new_one/Pages/redeem.dart';
import 'package:new_one/Widgets/materialcolour.dart';
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
        // ChangeNotifierProvider(create: (_)=>Languagecontroller()..init()),
        // ChangeNotifierProvider(create: (_) => configcontroller()),
        ChangeNotifierProvider(create: (_) => LoginController(context)),
        // ChangeNotifierProvider(create: (_) => dashboardcontroller()),
        // ChangeNotifierProvider(create: (_) => tripdetailcontroller()),
      ],
      child: Consumer<Languagecontroller>(builder: (context, langcon, child) {
        return MaterialApp(
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
              primarySwatch:
                  createMaterialColor(const Color.fromARGB(255, 1, 143, 154)),
            ),
            useMaterial3: true, // Enable Material 3
          ),
          home:
              RedeemPointsScreen(), // Ensure Loginscreen is a StatelessWidget or StatefulWidget
        );
      }),
    );
  }
}
