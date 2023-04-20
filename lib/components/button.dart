import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onTap;
  final String caption;
  final Color? color;
  final TextStyle? textStyle;
  final bool showLoader;

  const Button({
    Key? key,
    required this.onTap,
    required this.caption,
    this.color,
    this.textStyle,
    this.showLoader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(begin: Colors.transparent, end: color),
      duration: const Duration(milliseconds: 200),
      builder: (BuildContext context, Color? value, Widget? child) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: value,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: (showLoader)
                    ? const CircularProgressIndicator.adaptive()
                    : Text(
                        caption,
                        style: (textStyle != null)
                            ? textStyle
                            : Theme.of(context).textTheme.labelMedium,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
