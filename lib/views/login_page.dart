import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:synram_practical/bloc/auth/authentication_bloc.dart';
import 'package:synram_practical/helper/route_helper.dart';
import 'package:synram_practical/utils/app_images.dart';
import 'package:synram_practical/utils/app_widget.dart';
import 'package:synram_practical/utils/language_string.dart';
import 'package:synram_practical/utils/validation.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthenticationBloc authenticationBloc = AuthenticationBloc();
  TextEditingController phoneNumberCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool? loading = false;
  var response;
  bool iconButton = true;

  @override
  void initState() {
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: ((context, state) {
                if (state is AuthenticationLoaded) {
                  setState(() {
                    response = state.response;
                    print('My 123 ${response}');
                  });
                } else if (state is AuthenticationLoading) {
                  setState(() {
                    loading = state.loading;
                  });
                }
              }),
              builder: ((context, state) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                            width: 100.w,
                            height: 40.h,
                            child: Container(
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AppImages.vector1),
                                    fit: BoxFit.fill),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Image.asset(AppImages.logo,
                                      width: 70.w,
                                      height: 15.h,
                                      color: Colors.white,
                                      fit: BoxFit.contain),
                                ],
                              ),
                            )),
                        Flexible(
                          // width: 100.w,
                          // height: 55.h,
                          child: Form(
                              key: formKey,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      AppWidget.textFormFieldWidget(
                                          hintText: 'mobileNumber'.tr,
                                          icon: Icons.phone_outlined,
                                          suffixIcon: Icons.done,
                                          textInputType: TextInputType.number,
                                          textEditingController: phoneNumberCon,
                                          validator: FormValidation
                                              .phoneNumberValidation(
                                                  value: phoneNumberCon.text)),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      AppWidget.textFormFieldWidget(
                                          hintText: 'password'.tr,
                                          obscureText: iconButton,
                                          icon: Icons.lock_outline,
                                          onPressed: () {
                                            setState(() {
                                              iconButton = !iconButton;
                                            });
                                          },
                                          suffixIcon: iconButton == false
                                              ? Icons.remove_red_eye_outlined
                                              : Icons.remove_red_eye,
                                          actionType: TextInputAction.done,
                                          textEditingController: passCon,
                                          validator:
                                              FormValidation.passwordValidation(
                                                  value: passCon.text)),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            authenticationBloc.add(
                                                LogInButtonPressed(
                                                    username:
                                                        phoneNumberCon.text,
                                                    password: passCon.text));
                                          }
                                        },
                                        child: Text('Log In',
                                            style: TextStyle(fontSize: 16.sp)),
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2.w)),
                                            primary: Colors.orange.shade900,
                                            maximumSize: Size(100.w, 6.h),
                                            minimumSize: Size(100.w, 6.h)),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                    if (loading == true) AppWidget.circularIndicator(),
                  ],
                );
              }),
            )),
      ),
    );
  }
}
