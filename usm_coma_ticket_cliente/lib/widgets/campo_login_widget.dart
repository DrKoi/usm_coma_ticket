import 'package:flutter/material.dart';
import 'package:usm_coma_ticket_cliente/constants.dart';

class CampoLoginWidget extends StatefulWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void onFieldSubmitted;
  final void validator;
  final TextEditingController? controller;

  const CampoLoginWidget(
      {super.key,
      this.hintText,
      this.keyboardType,
      this.obscureText = false,
      this.focusNode,
      this.onFieldSubmitted,
      this.textInputAction,
      this.validator,
      this.controller});

  @override
  State<CampoLoginWidget> createState() => _CampoLoginWidgetState();
}

class _CampoLoginWidgetState extends State<CampoLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 18,
      ),
      decoration: BoxDecoration(
          color: kCampoLoginColor, borderRadius: kBordeLoginCampo),
      child: TextFormField(
        style: TextStyle(
          fontSize: 20,
          color: kTextLoginColor,
        ),
        textCapitalization: TextCapitalization.none,
        cursorColor: kTextLoginColor,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText!,
        focusNode: widget.focusNode,
        onFieldSubmitted: (value) => widget.onFieldSubmitted,
        textInputAction: widget.textInputAction,
        validator: (value) {
          widget.validator;
        },
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: kTextLoginColor,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
