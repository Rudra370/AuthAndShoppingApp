import 'package:aara_assignment/components/app_components.dart';
import 'package:aara_assignment/pages/verify_otp.dart';
import 'package:aara_assignment/service/app_services.dart';
import 'package:flutter/material.dart';
import 'package:easy_widgets/easy_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with EasyMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signup() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        mobileController.text.isEmpty ||
        genderController.text.isEmpty ||
        addressController.text.isEmpty ||
        passwordController.text.isEmpty) {
      context.showSimpleSnackBar('Please fill all the fields',
          backgroundColor: Colors.red);
      return;
    }
    FocusScope.of(context).unfocus();

    final res = await easyFuture(
        future: () => AppService.instance.registerUser(
            name: nameController.text,
            email: emailController.text,
            phone: mobileController.text,
            gender: genderController.text,
            address: addressController.text,
            password: passwordController.text),
        showSnackBarOnError: true,
        snackBarMessage: (e) => e.toString(),
        returnOnError: ()=>null);
    if (res != null) {
      context.push(VerifyOtp(phoneNumber: mobileController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: screenH,
          padding: EdgeInsets.symmetric(horizontal: 15.wWise),
          child: EasyScrollList(
            isScrollable: true,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (screenH * 0.05).hGap,
              Image.asset(
                'images/login.png',
                height: 160.hWise,
              ),
              15.hGap,
              AppTextField(
                controller: nameController,
                hintText: 'Full name',
              ),
              15.hGap,
              AppTextField(
                controller: emailController,
                hintText: 'Email Address',
              ),
              15.hGap,
              AppTextField(
                controller: mobileController,
                hintText: 'Mobile No.',
                keyboardType: TextInputType.number,
              ),
              15.hGap,
              AppTextField(
                controller: genderController,
                hintText: 'Gender',
              ),
              15.hGap,
              AppTextField(
                controller: addressController,
                hintText: 'Address',
              ),
              15.hGap,
              AppTextField(
                controller: passwordController,
                hintText: 'Password',
                isPassword: true,
                inputAction: TextInputAction.done,
              ),
              25.hGap,
              AppButton(
                text: 'Sign-up',
                onPressed: signup,
                height: 50.hWise,
                textSize: 15.hWise,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
