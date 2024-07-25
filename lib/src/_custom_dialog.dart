import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomDialog extends StatefulWidget {
  final String message;
  final String btnText;
  final int? maxLines;
  final TextAlign? textAlign;
  final double animationWidth;
  final double animationHeight;
  final Color? bgColor;
  final Color? textColor;
  final Color? btnColor;
  final Color? btnTextColor;
  final int? animationDuration;
  final String? headerAnimation;
  final VoidCallback? onBtnPressed;
  final bool blurBackground;
  final double blurAmount;
  final Color? alternativeBgColor;

  const CustomDialog({
    super.key,
    required this.message,
    this.maxLines,
    this.textAlign,
    required this.animationWidth,
    required this.animationHeight,
    this.bgColor,
    this.textColor,
    this.btnColor,
    this.btnTextColor,
    this.animationDuration,
    required this.btnText,
    this.headerAnimation,
    this.onBtnPressed,
    this.blurBackground = true,
    this.blurAmount = 20.0,
    this.alternativeBgColor,
  });

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = _createController();
  }

  @override
  Widget build(BuildContext context) {
    final dialogContent = Dialog(
      backgroundColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: widget.bgColor ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.headerAnimation != null)
              SizedBox(
                width: widget.animationWidth,
                height: widget.animationHeight,
                child: Lottie.asset(
                  widget.headerAnimation!,
                  controller: _controller,
                  onLoaded: (composition) {
                    _playAnimationOnce();
                  },
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.message,
                textAlign: widget.textAlign ?? TextAlign.center,
                maxLines: widget.maxLines ?? 2,
                style: TextStyle(color: widget.textColor ?? Colors.black),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: widget.onBtnPressed ?? () {
                Navigator.of(context).pop(); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.btnColor ?? CupertinoColors.activeBlue,
              ),
              child: Text(
                widget.btnText,
                style: TextStyle(color: widget.btnTextColor ?? Colors.white),
              ),
            ),
          ],
        ),
      ),
    );

    return widget.blurBackground
        ? dialogContent.frosted(blur: widget.blurAmount)
        : Container(
            color: widget.alternativeBgColor ?? Colors.black.withOpacity(0.7),
            child: dialogContent,
          );
  }

  AnimationController _createController() {
    return AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration ?? 600),
    );
  }

  void _playAnimationOnce() {
    _controller.forward().whenComplete(() {
      _controller.dispose();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
