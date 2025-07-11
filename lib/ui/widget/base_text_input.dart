import 'package:flutter/material.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';

class BaseTextInput extends StatefulWidget {
  final String? title;
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;
  final String hintText;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;
  final double? fontSize;
  final TextEditingController? textController;
  final double? borderRadius;

  final Color? cursorColor;
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
    this.title,
    this.cursorColor = AppColors.black,
    this.borderRadius,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines = 1,
    this.hintText = "",
    this.margin,
    this.padding,
    this.width,
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
    double heightTextInput = 56;
    if (widget.maxLines == widget.minLines && widget.maxLines > 1) {
      heightTextInput = 64.0 * (widget.maxLines / 2 ) - 16;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          BaseTextLabel(widget.title, isRequired: widget.isRequired, fontSize: 16, fontWeight: FontWeight.w500,),
        Container(
          height: heightTextInput,
          width: widget.width ?? double.infinity,
          margin: widget.margin ?? EdgeInsets.zero,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: widget.enabled ? widget.colorBgTextField : widget.colorBgTextFieldDisable,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 16)),
          child: Stack(
            children: [
              if (widget.isRequired && widget.title == null)
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
                cursorColor: widget.cursorColor,
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
                              padding: EdgeInsets.only(left: 0, right: 5),
                              child: InkWell(
                                onTap: widget.onTapSuffixIcon,
                                child: widget.suffixIcon,
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
                    enabledBorder: widget.enabledBorder ?? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
                    ),
                    focusedBorder: widget.focusedBorder ?? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.ff1f41bb,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
                    ),
                    hintStyle: widget.hintStyle ??
                        TextStyle(
                            color: !widget.enabled ? AppColors.black : AppColors.hintTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                    hintText: widget.hintText,
                ),
                controller: textController,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                obscureText: widget.isPasswordTF ? _showText : false,
              ),
            ],
          )
        ),
      ],
    );
  }

  String get value => textController.text.trim();
}