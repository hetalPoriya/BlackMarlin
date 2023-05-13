import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class FormValidation {
  static String? Function(String?)? phoneNumberValidation({String? value}) =>
      (value) {
        if (value == null || value.isEmpty) {
          return 'enterYourNumber'.tr;
        }else if(!GetUtils.isPhoneNumber(value)){
          return 'enterValidNumber'.tr;
        }
      };

  static String? Function(String?)? passwordValidation({String? value}) =>
      (value) {
        if (value == null || value.isEmpty) {
          return 'enterYourPassword'.tr;
        }
      };
}
