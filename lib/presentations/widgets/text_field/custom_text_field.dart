import 'package:flutter/material.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';
import 'package:suitmedia_app/presentations/theme/app_text.dart';

class CustomTextField extends StatefulWidget {
  final double? height;
  final double? width;
  final String? label;
  final String? subLabel;
  final String? hint;
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  CustomTextField({
    this.height,
    this.width,
    this.label,
    this.subLabel,
    this.hint,
    this.color,
    this.borderColor,
    this.padding,
    this.margin,
    this.controller,
    this.keyboardType,
    this.onTap,
    this.validator,
    this.onChanged,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      setState(() {
        _isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 40, minWidth: widget.width ?? 0),
      child: Container(
        height: widget.height,
        margin: widget.margin ?? const EdgeInsets.only(bottom: 8),
        padding: widget.padding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: widget.color ?? AppColor.kWhiteColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.transparent,
              child: SizedBox(
                height: 36,
                child: TextFormField(
                  validator: widget.validator,
                  onChanged: widget.onChanged,
                  onTap: widget.onTap,
                  focusNode: focusNode,
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textAlignVertical: TextAlignVertical.center,
                  style: AppText.kTitle,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    counterText: "",
                    hintText: widget.hint,
                    isDense: true,
                    errorStyle: AppText.kCaption
                        .copyWith(height: 0.046, color: Colors.red),
                    hintStyle: AppText.kTitle,
                    border: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
