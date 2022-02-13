import 'package:easy_widgets/easy_widget.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction inputAction;
  final bool isPassword;

  const AppTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.keyboardType,
    this.inputAction = TextInputAction.next,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.wWise,
        vertical: 12.hWise,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: 8.cBorderRadius,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.wWise,
            offset: Offset(0, 5.hWise),
          ),
        ],
      ),
      child: TextField(
        keyboardType: keyboardType,
        textInputAction: inputAction,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.hWise,
            color: Colors.blue[600],
          ),
        ),
        obscureText: isPassword,
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? textSize;
  final bool elevation;

  const AppButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color,
      this.textColor = Colors.white,
      this.width,
      this.height,
      this.textSize,
      this.elevation = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      borderRadius: 8.cBorderRadius,
      backgroundColor: color ?? Colors.orange[400],
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: textSize ?? 14.hWise,
          fontWeight: FontWeight.bold,
        ),
      ),
      width: width ?? double.infinity,
      height: height ?? 35.hWise,
      onTap: onPressed,
      splashColor: Colors.white12,
      highlightColor: Colors.transparent,
      elevation: elevation ? 4 : 0,
    );
  }
}

class CustomChip extends StatelessWidget {
  final String text;
  final Color color;
  final Function()? onPressed;
  const CustomChip(
      {Key? key, required this.text, this.color = Colors.grey, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 140.wWise,
        decoration: BoxDecoration(borderRadius: 50.cBorderRadius, color: color),
        padding: EdgeInsets.symmetric(vertical: 3.hWise, horizontal: 5.wWise),
        child: Row(
          children: [
            CircleAvatar(
              radius: 13.hWise,
              backgroundImage: const AssetImage('images/grocery.jpg'),
            ),
            8.wGap,
            Flexible(
              child: Text(
                text,
                style: TextStyle(fontSize: 13.hWise, color: Colors.white),
              ),
            ),
            10.wGap
          ],
        ),
      ),
    );
  }
}
