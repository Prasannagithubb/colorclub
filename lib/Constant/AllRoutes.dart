import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:new_one/Constant/ConstantRoutes.dart';
import 'package:new_one/Pages/finddealer/finddealer.dart';
import 'package:new_one/Pages/findproduct/findproduct.dart';
import 'package:new_one/Pages/homescreen/screens/QRpage.dart';
import 'package:new_one/Pages/homescreen/screens/home%20screen1.dart';
import 'package:new_one/Pages/kyc/kyc.dart';
import 'package:new_one/Pages/mydealer/my%20dealer.dart';
import 'package:new_one/Pages/mytransactions/mytransactions.dart';
import 'package:new_one/Pages/productscomplaint/productcom2.dart';
import 'package:new_one/Pages/redeem/redeem.dart';
import 'package:new_one/Pages/refercustomer/refercustomer.dart';

class Routes {
  static List<GetPage> allRoutes = [
    GetPage<dynamic>(
        name: ConstantRoutes.kyc,
        page: () => const KYCScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.home,
        page: () => const HomeScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.qrpage,
        page: () => const QRpage(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.redeempoints,
        page: () => const RedeemPointsScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.transactionscreen,
        page: () => TransactionsScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.referral,
        page: () => const ReferralScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.finddealer,
        page: () => FindDealerPage(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.findproduct,
        page: () => const Findproduct(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.refercustomer,
        page: () => const Refercustomer(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.productcomplaints,
        page: () => const Productcomplaintnew(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
  ];
}
