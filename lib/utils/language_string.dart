import 'package:get/get.dart';

class LanguageStrings extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          //main screen
          'changeLan': 'Change Language',
          'mainTitleText': 'Black Marlin',
          'welcome': 'Welcome',
          'welcomeNewText': 'BLACKMARLIN GENERAL TRADING CO.LTD CHINA - IRAQ',

          //main screen
          'report': 'Report',
          'balance': 'Balance',
          'order': 'Order',
          'trackContainer': 'Track Container',
          'shippingCostDaily': 'Shipping Cost Daily',
          'logOut': 'LogOut',
          'userName': 'User name',
          'userAddress': 'User address',
          'logIn': 'Log In',
          'blackMarlinDes':
              'Black Marlin is a private company specializing in providing safe and secure transport services. We hold ourselves to the highest ethical and professional standards. We adjust continuously and dynamically with the progression of the global community. We provide holistic solutions to all logistical and transport needs, from procurement to delivery.',
          'sureToLogOutText': 'Are you sure you want to logout?',
          'yes': 'Yes',
          'no': 'No',

          //login
          'mobileNumber': 'MOBILE NUMBER',
          'password': 'PASSWORD',
          'invalidCred': 'Enter correct username or password',

          //merchant balance
          'merchantBalance': 'Merchant Balance',
          'noDataFound': 'No Data Found',
          'sumAll': 'Sum All',
          'merchantOrder': 'Order',
          'merchantCompany': 'Merchant Company',
          'containerAmount': 'Container Amount',
          'exchangeBalance': 'Exchange Balance',

          //merchnat report
          'merchantReport': 'Merchant Report',
          'finalTotal': 'FINAL TOTAL',
          'usd': 'USD',
          'rmb': 'RMB',
          'receivedMoney': 'RECEIVED MONEY',
          'spendMoney': 'SPEND MONEY',

          //order details
          'orderDetails': 'Order Details',
          'orderNo': 'Order no.',
          'shopNo': 'Shop no.',
          'amount': 'Amount',
          'currencyType': 'Currency Type',
          'rate': 'Rate',
          'commission': 'Commission',
          'depositAmount': 'Deposit Amount',
          'depositBy': 'Deposit by',
          'cmb': 'CMB',
          'ctn': 'CTN',

          //shipping cost daily
          'container': 'CONTAINER',
          'cbmHealthProduct': 'CBM HEALTH PRODUCT',
          'cbmCopyProduct': 'CBM COPY PRODUCT',
          'shippingCost': 'Shipping Cost',

          //track container
          'comingSoon': 'Coming soon',

          //appWidget
          'total': 'TOTAL',
          'spent': 'SPENT',
          'received': 'RECEIVED',
          'remind': 'REMIND',
          'currency': 'CURRENCY',
          'received¥': 'Received ¥',
          'received\$': 'Received \$',
          'description': 'Description',
          'subject':
              'Subject: Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor',

          //validation
          'enterYourNumber': 'Please enter your mobile number',
          'enterValidNumber': 'Please enter valid mobile number',
          'enterYourPassword': 'Please enter password',
          'checkConnection': 'Check your internet connection.',
        },
        'ar': {
//main screen
          'changeLan': 'تغيير اللغة',
          'mainTitleText': 'بلاك مارلين',
          'welcome': 'أهلا وسهلا',
          'welcomeNewText':
              'شركة بلاك مارلين للتجارة العامة المحدودة الصين - العراق',

//main screen
          'report': 'تقرير',
          'balance': 'الرصيد',
          'order': 'اوردر',
          'trackContainer': 'تتبع الحاوية',
          'shippingCostDaily': 'تكلفة الشحن اليومية',
          'logOut': 'تسجيل خروج',
          'userName': 'اسم المستخدم',
          'userAddress': 'عنوان المستخدم',
          'logIn': 'تسجيل الدخول',
          'blackMarlinDes':
              'بلاك مارلين هي شركة خاصة متخصصة في تقديم خدمات نقل آمنة ومأمونة. نلتزم بأعلى المعايير الأخلاقية والمهنية. نحن نتكيف بشكل مستمر وديناميكي مع تقدم المجتمع العالمي. نحن نقدم حلولاً شاملة لجميع الاحتياجات اللوجستية والنقل ، من الشراء إلى التسليم.',
          'sureToLogOutText': 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
          'yes': 'نعم',
          'no': 'رقم',

//login
          'mobileNumber': 'رقم الهاتف المحمول',
          'password': 'كلمه السر',
          'invalidCred': 'Enter correct username or password',

//merchant balance
          'merchantBalance': 'رصيد التاجر',
          'noDataFound': 'لاتوجد بيانات',

          'sumAll': 'مجموع الكل',
          'merchantOrder': 'اوردر',
          'merchantCompany': 'صرف - واصل',
          'containerAmount': 'مبلغ الحاوية',
          'exchangeBalance': 'رصيد متبادل',

//merchnat report
          'merchantReport': 'تقرير التاجر',
          'finalTotal': 'المجموع النهائي',
          'usd': 'دولار',
          'rmb': 'يوان',
          'receivedMoney': 'النقود المستلمة',
          'spendMoney': 'صرف مبلغ',

//order details
          'orderDetails': 'تفاصيل الطلب',
          'orderNo': 'ر.طلب',
          'shopNo': 'ر.متجر',
          'amount': 'مبلغ',
          'currencyType': 'نوع العملة',
          'rate': 'معدل',
          'commission': 'عمولة',
          'depositAmount': 'قيمة الايداع',
          'depositBy': 'إيداع بواسطة',
          'cmb': 'سيبيم',
          'ctn': 'كارتون',

//shipping cost daily
          'container': 'حاوية',
          'cbmHealthProduct': 'المنتج الصحي CBM',
          'cbmCopyProduct': 'منتج نسخ CBM',
          'shippingCost': 'تكلفة الشحن',

//track container
          'comingSoon': 'قريبا',

//appWidget
          'total': 'المجموع',
          'spent': 'أنفق',
          'received': 'واصل',
          'remind': 'متبقى',
          'currency': 'عملة',
          'received¥': 'واصل ¥',
          'received\$': 'واصل \$',
          'description': 'وصف',
          'subject': ' موضوعات:',

//validation
          'enterYourNumber': 'الرجاء إدخال رقم هاتفك المحمول',
          'enterValidNumber': 'الرجاء إدخال رقم هاتف محمول صحيح',
          'enterYourPassword': 'الرجاء إدخال كلمة المرور',
          'checkConnection': 'تحقق من اتصالك بالإنترنت.',
        },
        'ckb': {
//main screen
          'changeLan': 'تغيير اللغة',
          'mainTitleText': 'بلاك مارلين',
          'welcome': 'بەخێربێیت',
          'welcomeNewText': 'بەخێر بێیت دەقی نوێ',

//main screen
          'report': 'ڕاپۆرت',
          'balance': 'بالانس',
          'order': 'ئۆردەر',
          'trackContainer': 'تراکی کۆنتێنەر',
          'shippingCostDaily': 'تێچووی گەیاندن ڕۆژانە',
          'logOut': 'دەرچوون',
          'userName': 'ناوی بەکارهێنەر',
          'userAddress': 'ناونیشانی بەکارهێنەر',
          'logIn': 'داخل بوون',
          'blackMarlinDes':
              'بلاک مارلین کۆمپانیەیەکی تایبەتمەندە لە پێشکەشکردنی خزمەتگوزارییەکانی گواستنەوەی سەلامەت و متمانەپێکراو. بە بەرزترین ستانداردەکانی ڕاستگۆیی و پیشەیی کار دەکەین، هەروەها هەمیشە بەرامبەر بە گۆڕانی پێداویستییەکانی کۆمەڵگەی جیهانی خۆماندەگونجێنین. ئێمە چارەسەری گشتگیر و تەواو بۆ سەرجەم گواستنەوەکانتان دابین دەکەین – لە وەرگرتنەوە تاکو گەیاندن',
          'sureToLogOutText': 'ئایا دڵنیای کە دەتەوێت دەربچیت؟',
          'yes': 'بەڵێ',
          'no': 'نەخێر',

//login
          'mobileNumber': 'ژماره‌ی مۆبایل',
          'password': 'وشه‌ى نهێني',
          'invalidCred': 'ناوی بەکارهێنەر یان وشەی نهێنی دروست دابنێ',

//merchant balance
          'merchantBalance': 'باڵانسی بازرگان',
          'noDataFound': 'هیچ داتایەک نەدۆزراوە',

          'sumAll': 'کۆی هەموو',
          'merchantOrder': 'ئۆردەر',
          'merchantCompany': 'خەرجکراوە - وەرگیراوە',
          'containerAmount': 'پارەی کۆنتێنەر',
          'exchangeBalance': 'باڵانسی ئاڵوگۆڕ',

//merchnat report
          'merchantReport': 'ڕاپۆرتی بازرگان',
          'finalTotal': 'کۆی گشتی کۆتایی',
          'usd': 'دولار',
          'rmb': 'يوان',
          'receivedMoney': 'پارەی وەرگيراو',
          'spendMoney': 'پارەی سەرفكراو',

//order details
          'orderDetails': 'وردەکارییەکانی ئوردەر',
          'orderNo': 'ژ.ئوردەر',
          'shopNo': 'ژ.دوكاندار',
          'amount': 'بڕى پارە',
          'currencyType': 'جۆری دراو',
          'rate': 'ڕێژە',
          'commission': 'کۆمشن',
          'depositAmount': 'پارەی پێشەکی',
          'depositBy': 'پارەی پێشەکی لەلایەن',
          'cmb': 'سيبيم',
          'ctn': 'كارتون',

//shipping cost daily
          'container': 'حاويە',
          'cbmHealthProduct': 'بەرهەمی تەندروستی CBM',
          'cbmCopyProduct': 'بەرهەمی کۆپی CBM',
          'shippingCost': 'نرخی بارکردن',

//track container
          'comingSoon': 'بەم زووانە دەگات',

//appWidget
          'total': 'گشتی',
          'spent': 'سەرف كراو',
          'received': 'واصل',
          'remind': 'ماوه',
          'currency': 'عمولە',
          'received¥': 'واصل ¥',
          'received\$': 'واصل \$',
          'description': 'وصف',
          'subject': 'بابەتەكان:',

//validation
          'enterYourNumber': 'تکایە ژمارەی مۆبایلەکەت بنووسە',
          'enterValidNumber': 'تکایە ژمارەی مۆبایلی دروست بنووسە',
          'enterYourPassword': 'تکایە ژمارەی مۆبایلەکەت بنووسە',
          'checkConnection': 'تکایە ژمارەی مۆبایلی دروست بنووسە',
        },
      };
}
