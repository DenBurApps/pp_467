import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';

class CustomTextField extends StatefulWidget {
  final String placeholder;
  final TextEditingController? controller;
  final Function(String) onChanged;
  final bool multiline;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? expands;
  final Color? color;

  const CustomTextField({
    super.key,
    required this.placeholder,
    this.controller,
    required this.onChanged,
    required this.multiline,
    this.keyboardType,
    this.inputFormatters,
    this.expands,
    this.color,
  });

  CustomTextField.numeric({
    super.key,
    required this.placeholder,
    this.controller,
    required this.onChanged,
    required this.multiline,
    bool allowNegative = false,
    this.expands,
    this.color,
  })  : keyboardType = TextInputType.numberWithOptions(
            decimal: true, signed: allowNegative),
        inputFormatters = <TextInputFormatter>[
          if (!allowNegative)
            FilteringTextInputFormatter.allow(
              RegExp(r'[0-9]+[,.]?[0-9]*'),
            ),
          TextInputFormatter.withFunction(
            (oldValue, newValue) => newValue.copyWith(
              text: newValue.text.replaceAll(',', '.'),
            ),
          ),
        ];

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    if (widget.controller == null) {
      _controller = TextEditingController();
    } else {
      _controller = widget.controller!;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.text.bodyMedium.copyWith(
      color: context.colors.onSurface,
    );
    return Stack(
      children: [
        CupertinoTextField(
          padding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 10,
          ),
          minLines: widget.multiline ? 6 : 1,
          maxLines: widget.multiline || widget.expands != null ? null : 1,
          cursorColor: context.colors.primary,
          cursorHeight: 22,
          style: textStyle,
          controller: _controller,
          decoration: BoxDecoration(
            color: widget.color ?? context.colors.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          onChanged: (value) {
            setState(() {});
            widget.onChanged(value);
          },
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
        ),
        AnimatedSwitcher(
          duration: Durations.short2,
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: _controller.text.isEmpty
              ? GestureDetector(
                  onTap: () {
                    _focusNode.requestFocus();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 10,
                    ),
                    child: Text(
                      widget.placeholder,
                      style: textStyle.copyWith(
                        color: context.colors.surfaceBright,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
