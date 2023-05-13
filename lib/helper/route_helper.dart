import 'package:get/get.dart';
import 'package:synram_practical/views/black_marlin_des.dart';
import 'package:synram_practical/views/choose_language.dart';
import 'package:synram_practical/views/full_screen_image.dart';
import 'package:synram_practical/views/get_containers.dart';
import 'package:synram_practical/views/merchant_balance.dart';
import 'package:synram_practical/views/merchant_report.dart';
import 'package:synram_practical/views/order_reports.dart';
import 'package:synram_practical/views/shipping_cost_daily.dart';
import 'package:synram_practical/views/show_pdf.dart';
import 'package:synram_practical/views/track_container.dart';
import 'package:synram_practical/views/welcome_page.dart';
import 'package:synram_practical/views/login_page.dart';
import 'package:synram_practical/views/main_screen.dart';

class RouteHelper {
  static String welcomePage = '/welcome';
  static String logIn = '/logIn';
  static String mainScreen = '/mainScreen';
  static String merchantBal = '/merchantBal';
  static String shippingCostDaily = '/shippingCostDaily';
  static String merchantReportClass = '/merchantReportClass';
  static String orderReport = '/orderReport';
  static String trackContainer = '/trackContainer';
  //static String fullScreenImage = '/fullScreenImage';
  // static String blackMarlinDes = '/blackMarlinDes';
  static String chooseLan = '/chooseLan';
  static String getContainers = '/getContainers';
  static String showPdf = '/showPdf';

  static List<GetPage> allPages = [
    GetPage(name: welcomePage, page: () => WelcomePage()),
    GetPage(name: logIn, page: () => LoginPage()),
    GetPage(name: mainScreen, page: () => MainScreen()),
    GetPage(name: merchantBal, page: () => MerchantBalance()),
    GetPage(name: shippingCostDaily, page: () => ShippingCostDaily()),
    GetPage(name: merchantReportClass, page: () => MerchantReportClass()),
    GetPage(name: orderReport, page: () => OrderReport()),
    GetPage(name: trackContainer, page: () => TrackContainer()),
    //GetPage(name: fullScreenImage, page: () => FullScreenImage()),
    // GetPage(name: blackMarlinDes, page: () => BlackMarlinDescription()),
    GetPage(name: chooseLan, page: () => ChooseLanguage()),
    GetPage(name: getContainers, page: () => GetContainers()),
    GetPage(name: showPdf, page: () => ShowPdf()),
  ];
}
