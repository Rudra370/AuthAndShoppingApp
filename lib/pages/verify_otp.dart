import 'package:aara_assignment/components/app_components.dart';
import 'package:aara_assignment/pages/product_page.dart';
import 'package:aara_assignment/service/app_services.dart';
import 'package:flutter/material.dart';
import 'package:easy_widgets/easy_widget.dart';

class VerifyOtp extends StatefulWidget {
  final String phoneNumber;
  const VerifyOtp({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> with EasyMixin {
  final TextEditingController otpController = TextEditingController();
  void verify() async {
    if (otpController.text.isEmpty) {
      context.showSimpleSnackBar('Please enter OTP');
      return;
    }
    FocusScope.of(context).unfocus();
    final res = await easyFuture(
      future: () async => await AppService.instance
          .verifyOTP(phone: widget.phoneNumber, otp: otpController.text),
      returnOnError: () => null,
      showSnackBarOnError: true,
      snackBarMessage: (e) => e.toString(),
    );
    if (res != null) {
      context.pushAndRemoveUntil(const ProductPage(), (p0) => false);
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
                controller: otpController,
                hintText: 'Verify otp',
                keyboardType: TextInputType.number,
              ),
              40.hGap,
              AppButton(
                text: 'Verify otp',
                onPressed: verify,
                height: 50.hWise,
                textSize: 15.hWise,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
