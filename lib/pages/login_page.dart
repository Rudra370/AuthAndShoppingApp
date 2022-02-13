import 'package:aara_assignment/components/app_components.dart';
import 'package:aara_assignment/pages/login_otp.dart';
import 'package:aara_assignment/pages/signup_page.dart';
import 'package:aara_assignment/pages/verify_otp.dart';
import 'package:aara_assignment/service/app_services.dart';
import 'package:flutter/material.dart';
import 'package:easy_widgets/easy_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with EasyMixin {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
      context.showSimpleSnackBar('Please enter all the fields',
          backgroundColor: Colors.red);
      return;
    }
    FocusScope.of(context).unfocus();

    final data = await easyFuture(
        future: () async => await AppService.instance.login(
            phone: phoneController.text, password: passwordController.text),
        showSnackBarOnError: true,
        snackBarMessage: (e) => e.toString(),
        returnOnError: () => null);
    if (data != null) {
      context.push(VerifyOtp(phoneNumber: phoneController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.wWise),
          child: EasyScrollList(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                'images/login.png',
                height: 160.hWise,
              ),
              15.hGap,
              AppTextField(
                controller: phoneController,
                hintText: 'Phone',
                keyboardType: TextInputType.number,
              ),
              15.hGap,
              AppTextField(
                controller: passwordController,
                hintText: 'Password',
                isPassword: true,
                inputAction: TextInputAction.done,
              ),
              20.hGap,
              Row(
                children: [
                  TextButton(
                      onPressed: () {}, child: const Text('Forgot Password?')),
                  const Spacer(),
                  AppButton(
                    text: 'Login',
                    onPressed: login,
                    width: 165.wWise,
                  ),
                ],
              ),
              40.hGap,
              AppButton(
                text: 'Login with OTP',
                onPressed: () {
                  context.push(const LoginOTP(),
                      transitionType: EasyTransitionType.rightToLeft);
                },
                height: 50.hWise,
                textSize: 15.hWise,
              ),
              15.hGap,
              AppButton(
                text: 'New Registration',
                onPressed: () {
                  context.push(const SignupPage(),
                      transitionType: EasyTransitionType.rightToLeft);
                },
                color: Colors.white,
                textColor: Colors.black,
                height: 50.hWise,
                textSize: 15.hWise,
              ),
              const Spacer(),
              RichText(
                text: const TextSpan(
                  text: 'By clicking continue to agree\n our ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
