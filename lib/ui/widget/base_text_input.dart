import 'package:flutter/material.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';
import '../../res/colors.dart';

class BaseTextInput extends StatefulWidget {
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;
  final String hintText;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;
  final double? heightTextInput;
  final double? fontSize;
  final TextEditingController? textController;

  final FontWeight? fontWeight;
  final TextAlign? align;
  final bool enabled;
  final Color colorBgTextField;
  final Color colorBgTextFieldDisable;
  final Color colorText;
  final int maxLength;
  final Widget? suffixIcon;
  final double? suffixIconMargin;
  final Widget? prefixIcon;
  final bool isPasswordTF;
  final bool isRequired;
  final VoidCallback? onTapSuffixIcon;
  final TextStyle? hintStyle;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final FocusNode? focusNode;

  BaseTextInput({
    Key? key,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines = 1,
    this.hintText = "",
    this.margin,
    this.padding,
    this.width,
    this.heightTextInput = 64,
    this.textController,
    this.fontWeight,
    this.align,
    this.enabled = true,
    this.colorText = Colors.black,
    this.maxLength = TextField.noMaxLength,
    this.suffixIcon,
    this.suffixIconMargin,
    this.prefixIcon,
    this.isPasswordTF = false,
    this.isRequired = false,
    this.colorBgTextField = AppColors.white,
    this.colorBgTextFieldDisable = AppColors.disable,
    this.onTapSuffixIcon,
    this.fontSize,
    this.hintStyle,
    this.disabledBorder,
    this.focusedBorder,
    this.enabledBorder,
    this.focusNode,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TextFieldState();
  }
}

class TextFieldState extends State<BaseTextInput> {
  bool _showText = true;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = widget.textController ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heightTextInput,
      width: widget.width ?? double.infinity,
      margin: widget.margin ?? EdgeInsets.zero,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: widget.enabled ? widget.colorBgTextField : widget.colorBgTextFieldDisable,
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          if (widget.isRequired)
            Container(
              padding: const EdgeInsets.only(left: 10, top: 3),
              child: const BaseTextLabel(
                "*",
                color: AppColors.colorError,
              ),
            ),
          TextField(
            keyboardType: widget.keyboardType,
            focusNode: widget.focusNode,
            maxLength: widget.maxLength,
            cursorColor: AppColors.base_color,
            enabled: widget.enabled,
            textAlign: widget.align ?? TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
                color: widget.colorText,
                fontSize: widget.fontSize ?? 16,
                fontWeight: widget.fontWeight ?? FontWeight.w400),
            decoration: InputDecoration(
                counterText: "",
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: widget.suffixIconMargin ?? 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.isPasswordTF == true)
                        IconButton(
                          icon: Icon(!_showText ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                          onPressed: () {
                            setState(() {
                              _showText = !_showText;
                            });
                          },
                        ),
                      if (widget.suffixIcon != null)
                        Padding(
                          padding: EdgeInsets.only(left: 0, right: 0),
                          child: InkWell(
                            child: widget.suffixIcon,
                            onTap: () => widget.onTapSuffixIcon,
                          ),
                        ),
                    ],
                  ),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: widget.prefixIcon,
                ),
                focusColor: Colors.white,
                border: InputBorder.none,
                suffixIconConstraints: BoxConstraints(maxHeight: 35),
                prefixIconConstraints: BoxConstraints(maxHeight: 35),
                disabledBorder: widget.disabledBorder ??
                    UnderlineInputBorder(borderSide: BorderSide(color: AppColors.border)),
                focusedBorder: widget.focusedBorder ??
                    UnderlineInputBorder(borderSide: BorderSide(color: AppColors.focusBorder)),
                enabledBorder: widget.enabledBorder ??
                    UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.border)),
                hintStyle: widget.hintStyle ??
                    TextStyle(
                        color: !widget.enabled ? AppColors.black : AppColors.hintTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                hintText: widget.hintText,
                contentPadding: widget.padding ?? EdgeInsets.symmetric(horizontal: 10, vertical: (widget.heightTextInput! - 16) / 2)
            ),
            controller: textController,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            obscureText: widget.isPasswordTF ? _showText : false,
          ),
        ],
      ),
    );
  }

  String get value => textController.text.trim();
}