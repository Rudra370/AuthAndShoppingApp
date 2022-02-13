import 'package:aara_assignment/components/app_components.dart';
import 'package:aara_assignment/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:easy_widgets/easy_widget.dart';

class LoginOTP extends StatefulWidget {
  const LoginOTP({Key? key}) : super(key: key);

  @override
  _LoginOTPState createState() => _LoginOTPState();
}

class _LoginOTPState extends State<LoginOTP> {
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
                controller: TextEditingController(),
                hintText: 'Phone Number',
                keyboardType: TextInputType.number,
              ),
              15.hGap,
              AppButton(
                text: 'Send OTP',
                onPressed: () {},
                height: 50.hWise,
                textSize: 15.hWise,
              ),
              80.hGap,
              AppButton(
                text: 'Login with Id Password',
                onPressed: () {},
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
