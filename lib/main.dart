import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kurdish_localization/flutter_kurdish_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:synram_practical/bloc/auth/authentication_bloc.dart';
import 'package:synram_practical/bloc/get_container_bloc.dart';
import 'package:synram_practical/bloc/get_container_bloc.dart';
import 'package:synram_practical/bloc/merchant/merchant_balance/merchant_balance_bloc.dart';
import 'package:synram_practical/bloc/merchant/merchant_report/merchant_report_bloc.dart';
import 'package:synram_practical/bloc/news/get_news_bloc.dart';
import 'package:synram_practical/bloc/order/get_order_bloc.dart';
import 'package:synram_practical/bloc/ship/ship_bloc.dart';
import 'package:synram_practical/bloc/shipingCostDaily/shipping_cost_daily_bloc.dart';
import 'package:synram_practical/helper/route_helper.dart';
import 'package:synram_practical/utils/app_string.dart';
import 'package:synram_practical/utils/language_string.dart';
import 'package:synram_practical/utils/shared_pref.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceClass.getInstance();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    // runApp(
    //   DevicePreview(
    //     enabled: !kReleaseMode,
    //     builder: (context) => MyApp(), // Wrap your app
    //   ),
    // );

    String code = SharedPreferenceClass.getString(AppStrings.localCode,
        defValue: 'en_US');
    print('Code1 $code');
    runApp(new MyApp(
      code: code,
    ));
  });
}

class MyApp extends StatelessWidget {
  String code;

  MyApp({Key? key, required this.code}) : super(key: key);

  List<Locale> supportedLocales = [
    //Locale('ckb'),
    Locale('ckb'),
    Locale('ar'),
    Locale('en-US')
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>(
                create: (_) => AuthenticationBloc()),
            BlocProvider<ShippingCostDailyBloc>(
                create: (_) => ShippingCostDailyBloc()),
            BlocProvider<GetOrderBloc>(create: (_) => GetOrderBloc()),
            BlocProvider<MerchantBalanceBloc>(
                create: (_) => MerchantBalanceBloc()),
            BlocProvider<MerchantReportBloc>(
                create: (_) => MerchantReportBloc()),
            BlocProvider<GetNewsBloc>(create: (_) => GetNewsBloc()),
            BlocProvider<ShipBloc>(create: (_) => ShipBloc()),
            BlocProvider<GetContainerBloc>(create: (_) => GetContainerBloc()),
          ],
          child: GetMaterialApp(
            title: 'mainTitleText'.tr,
            debugShowCheckedModeBanner: false,
            translations: LanguageStrings(),
            locale: Locale(code),
            localizationsDelegates: [
              KurdishMaterialLocalizations.delegate,
              KurdishWidgetLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            //supportedLocales: supportedLocales,
            initialRoute: RouteHelper.welcomePage,
            getPages: RouteHelper.allPages,
            theme: ThemeData(
              primaryColor: Colors.orange.shade600,
            ),
          ),
        );
      },
    );
  }
}
