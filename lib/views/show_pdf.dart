import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:synram_practical/utils/app_string.dart';
import 'package:synram_practical/utils/shared_pref.dart';
import 'package:synram_practical/utils/app_widget.dart';
import 'package:sizer/sizer.dart';

class ShowPdf extends StatefulWidget {
  const ShowPdf({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowPdf> createState() => _ShowPdfState();
}

class _ShowPdfState extends State<ShowPdf> {
  @override
  void initState() {
    _readFile();
    super.initState();
  }

  Future get _localPath async {
    // Application documents directory: /data/user/0/{package_name}/{app_name}
    final applicationDirectory = await getApplicationDocumentsDirectory();
    return applicationDirectory.path;
  }

  Future get _localFile async {
    final path = await _localPath;
    return File('$path/MerchantReport.pdf');
  }

  Future _readFile() async {
    try {
      final file = await _localFile;

      // Read the file
      return await file.readAsString();
    } catch (e) {
      // Return null if we encounter an error
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppWidget.appBarWidget(text: 'merchantReport'.tr),
            Expanded(
              child: SfPdfViewer.network(
                  'https://blackmarlinco.com/sys/ApiController/downloadReport?userID=${SharedPreferenceClass.getString(AppStrings.userId)}'),
            ),
          ],
        ),
      ),
    );
  }
}
